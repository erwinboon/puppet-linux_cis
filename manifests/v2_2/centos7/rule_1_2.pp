# == Class: linux_cis::v2_2::centos7::rule_1_2
#includes Rules:
#RHEL
# 1.2.1 Ensure package manager repositories are configured (Not Scored)
# 1.2.2 Ensure gpgcheck is globally activated(Not Scored)
# 1.2.3 Ensure GPG keys are configured (Not Scored)
# 1.2.4 Ensure Red Hat Network or Subscription Manager connection is configured (Not Scored)
# 1.2.5 Disable the rhnsd Daemon (Not Scored)

#CentOS
#NOT CHECKED 1.2.1 Ensure package manager repositories are configured 
#NOT CHECKED 1.2.2 Ensure GPG keys are configured
#1.2.3 Ensure gpgcheck is globally activated 

class linux_cis::v2_2::centos7::rule_1_2 {
  #1.2.1
  #  notify {"NOT CHECKED 1.2.1 Ensure package manager repositories are configured ": loglevel => "debug" }

  #1.2.2
  #  notify {"NOT CHECKED 1.2.2 Ensure GPG keys are configured": loglevel => "debug" }

  #1.2.3
  file_line { '(1.2.3) /etc/yum.conf contains gpgcheck=1':
    ensure => present,
    path   => '/etc/yum.conf',
    line   => 'gpgcheck=1',
  }
}
