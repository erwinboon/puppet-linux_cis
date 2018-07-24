# == Class: linux_cis::v2_2::rhel7::rule_4_3
# includes Rules:
# 4.3 - Configure logrotate (Not Scored)

class linux_cis::v2_2::rhel7::rule_4_3 (
  $logs = $::linux_cis::params::logs
) inherits linux_cis::params {
  $file = '/etc/logrotate.d/syslog'

  file { "(4.3) - ${file} exists":
    ensure => file,
    name   => $file,
    mode   => '0644',
    owner  => 'root',
    group  => 'root',
  }
  each ($logs) |$log| {
    file_line { "(4.3) - ${file}: ${log}":
      ensure   => present,
      path     => $file,
      line     => $log,
      match    => "^${log}",
      multiple => false,
    }
  }
}
