# == Class: linux_cis::v2_2::centos7::rule_5_6
#includes Rules:
# 5.6 Ensure access to the su command is restricted 

class linux_cis::v2_2::centos7::rule_5_6 {
  file_line { '(5.6) - Ensure access to the su command is restricted ':
    ensure => present,
    path   => '/etc/pam.d/su',
    line   => 'auth required pam_wheel.so use_uid',
    match  => '^auth required pam_wheel.so',
  }
  user {'root':
    ensure => present,
    uid    => 0,
    gid    => 0,
    groups => ['wheel'],
  }
}