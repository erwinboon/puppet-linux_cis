# == Class: linux_cis::v2_2::centos7::rule_3_2
# includes Rules:
#3.2.1 Ensure source routed packets are not accepted 
#3.2.2 Ensure ICMP redirects are not accepted 
#3.2.3 Ensure secure ICMP redirects are not accepted
#3.2.4 Ensure suspicious packets are logged
#3.2.5 Ensure broadcast ICMP requests are ignored
#3.2.6 Ensure bogus ICMP responses are ignored
#3.2.7 Ensure Reverse Path Filtering is enabled 
#3.2.8 Ensure TCP SYN Cookies is enabled

class linux_cis::v2_2::centos7::rule_3_2(
  $enabled = $linux_cis::params::rule_3_2,
) {
if $enabled {

    #3.2.1
    sysctl { 'net.ipv4.conf.all.accept_source_route':
      ensure => present,
      value  => '0',
    }
    sysctl { 'net.ipv4.conf.default.accept_source_route':
      ensure => present,
      value  => '0',
    }
    #3.2.2
    sysctl { 'net.ipv4.conf.all.accept_redirects':
      ensure => present,
      value  => '0',
    }
    sysctl { 'net.ipv4.conf.default.accept_redirects':
      ensure => present,
      value  => '0',
    }
    #3.2.3
    sysctl { 'net.ipv4.conf.all.secure_redirects':
      ensure => present,
      value  => '0',
    }
    sysctl { 'net.ipv4.conf.default.secure_redirects':
      ensure => present,
      value  => '0',
    }
    #3.2.4
    sysctl { 'net.ipv4.conf.all.log_martians':
      ensure => present,
      value  => '1',
    }
    sysctl { 'net.ipv4.conf.default.log_martians':
      ensure => present,
      value  => '1',
    }
    #3.2.5
    sysctl { 'net.ipv4.icmp_echo_ignore_broadcasts':
      ensure => present,
      value  => '1',
    }
    #3.2.6
    sysctl { 'net.ipv4.icmp_ignore_bogus_error_responses':
      ensure => present,
      value  => '1',
    }
    #3.2.7
    sysctl { 'net.ipv4.conf.all.rp_filter':
      ensure => present,
      value  => '1',
    }
    sysctl { 'net.ipv4.conf.default.rp_filter':
      ensure => present,
      value  => '1',
    }
    #3.2.8
    sysctl { 'net.ipv4.tcp_syncookies':
      ensure => present,
      value  => '1',
    }
  }
}
