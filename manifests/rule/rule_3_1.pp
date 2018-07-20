# == Class: cis_rhel7::rule::rule_3_1
#includes Rules:
#3.1.1 Ensure IP forwarding is disabled
#3.1.2 Ensure packet redirect sending is disabled 

class cis_rhel7::rule::rule_3_1 (
  $enabled = $cis_rhel7::params::rule_3_1,
) {
  if $enabled {

    #3.1.1
    sysctl { 'net.ipv4.ip_forward':
      ensure => present,
      value  => '0',
    }
    #3.1.2
    sysctl { 'net.ipv4.conf.all.send_redirects':
      ensure => present,
      value  => '0',
    }
    sysctl { 'net.ipv4.conf.default.send_redirects':
      ensure => present,
      value  => '0',
    }
  }
}
