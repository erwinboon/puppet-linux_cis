# == Class: cis_rhel7::rule::rule_3_3
# includes Rules:
#3.3.1 Ensure IPv6 router advertisements are not accepted 
#3.3.2 Ensure IPv6 redirects are not accepted
#3.3.3 Ensure IPv6 is disabled

class cis_rhel7::rule::rule_3_3 (
  $disable_ipv6_router_advertisements = true,
  $disable_ipv6_redirects = true,
  $disable_ipv6 = true
) {
  $file_cis = '/etc/modprobe.d/CIS.conf'

  if $disable_ipv6_router_advertisements {
    #3.3.1
    sysctl { 'net.ipv6.conf.all.accept_ra':
      ensure => present,
      value  => '0',
    }
    sysctl { 'net.ipv6.conf.default.accept_ra':
      ensure => present,
      value  => '0',
    }
  }
  if $disable_ipv6_redirects {
    #3.3.2
    sysctl { 'net.ipv6.conf.all.accept_redirects':
      ensure => present,
      value  => '0',
    }
    sysctl { 'net.ipv6.conf.default.accept_redirects':
      ensure => present,
      value  => '0',
    }
  }
  kmod::option { 'ipv6':
    option => 'disable',
    value  => '1',
    file   => $file_cis,
    ensure => $disable_ipv6 ? {
      true    => present,
      false   => absent,
      default => present,
    }
  }
}
