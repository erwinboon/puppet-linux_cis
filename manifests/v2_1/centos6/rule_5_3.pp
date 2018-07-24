# class to manage PAM settings
#
# @param max_login_retries Set the maximum allowed login tries
# @param min_password_length Set the minimum password length for local users
# @param password_digits_present Set the digits in password requirement
# @param password_ucaser_present Set the uppercase character in password requirement
# @param password_lcase_present Set the lowercase character in password requirement
# @param password_other_present Set the other character in password requirement
# @param lockout_time Set the lock-out time when login attempt has failed
# @param password_history Set the password history for reusing passwords
# @param password_algoritm Password algoritm to use when storing passwords
#
class linux_cis::v2_1::centos6::rule_5_3 (
  Integer $max_login_retries       = 3,
  Integer $min_password_length     = 14,
  Integer $password_digits_present = -1, #dcredit
  Integer $password_ucaser_present = -1, #ucredit
  Integer $password_lcase_present  = -1, #lcredit
  Integer $password_other_present  = -1, #ocredit
  Integer $lockout_time            = 900,
  Integer $password_history        = 5,
  String $password_algoritm        = 'sha512',
){
  $services = [
    'system-auth',
    'password-auth'
  ]
  #5.3.1 - Ensure password creation requirements are configured (Scored)
  $services.each | $service | {
    pam { "5.3.1 pam_cracklib ${service}":
      ensure    => present,
      service   => $service,
      type      => 'password',
      module    => 'pam_cracklib.so',
      control   => 'requisite',
      arguments => [
        'try_first_pass',
        "retry=${max_login_retries}",
        "minlen=${min_password_length}",
        "dcredit=${password_digits_present}",
        "ucredit=${password_ucaser_present}",
        "lcredit=${password_lcase_present}",
        "ocredit=${password_other_present}"
      ]
    }
  }
  #5.3.2 - Ensure lockout for failed password attempts is configured (Scored)
  $services.each | $service | {
    pam { "5.3.2 pam_unix ${service}":
      ensure           => present,
      service          => $service,
      type             => 'auth',
      module           => 'pam_unix.so',
      control          => '[success=1 default=bad]',
      control_is_param => true,
      arguments        => [],
    }
    pam { "5.3.2 pam_faillock preauth ${service}":
      ensure           => present,
      service          => $service,
      type             => 'auth',
      module           => 'pam_faillock.so',
      control          => 'required',
      control_is_param => true,
      arguments        => [
        'preauth',
        'audit',
        'silent',
        'deny=5',
        "unlock_time=${lockout_time}"
      ],
      position         => 'before *[type="auth" and module="pam_unix.so"]',
    }
    pam { "5.3.2 pam_faillock authfail ${service}":
      ensure           => present,
      service          => $service,
      type             => 'auth',
      module           => 'pam_faillock.so',
      control          => '[default=die]',
      control_is_param => true,
      arguments        => [
        'authfail',
        'audit',
        'deny=5',
        "unlock_time=${lockout_time}"
      ],
      position         => 'after *[type="auth" and module="pam_unix.so"]',
    }
    pam { "5.3.2 pam_faillock authsucc ${service}":
      ensure           => present,
      service          => $service,
      type             => 'auth',
      module           => 'pam_faillock.so',
      control          => 'sufficient',
      control_is_param => true,
      arguments        => [
        'authsucc',
        'audit',
        'deny=5',
        "unlock_time=${lockout_time}"
      ],
      position         => 'after *[type="auth" and module="pam_faillock.so" and control="[default=die]"]',
    }
  }
  #5.3.3 - Ensure password reuse is limited (Scored)
  #5.3.4 - Ensure password hashing algorithm is SHA-512 (Scored)
  $services.each | $service | {
    pam { "5.3.3 and 5.3.4 pam_unix password ${password_algoritm} remember=${password_history} ${service}":
      ensure    => present,
      service   => $service,
      type      => 'password',
      module    => 'pam_unix.so',
      control   => 'sufficient',
      arguments => [
        $password_algoritm,
        "remember=${password_history}"
      ],
    }
  }
}
