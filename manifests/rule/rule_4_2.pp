class cis_rhel7::rule::rule_4_2 (
) inherits cis_rhel7::params {

# includes Rules:
#NOT USED 4.2.1.1 Ensure rsyslog Service is enabled
#NOT USED 4.2.1.2 Ensure logging is configured
#NOT USED 4.2.1.3 Ensure rsyslog default file permissions configured
#NOT USED 4.2.1.4 Ensure rsyslog is configured to send logs to a remote log host
#NOT USED 4.2.1.5 Ensure remote rsyslog messages are only accepted on designated log hosts
#NOT USED 4.2.2.1 Ensure syslog-ng service is enabled 
#NOT USED 4.2.2.2 Ensure logging is configured
#NOT USED 4.2.2.3 Ensure syslog-ng default file permissions configured
#NOT USED 4.2.2.4 Ensure syslog-ng is configured to send logs to a remote log host
#NOT USED 4.2.2.5 Ensure remote syslog-ng messages are only accepted on designated log hosts
#NOT USED 4.2.3 Ensure rsyslog or syslog-ng is installed 
#NOT USED 4.2.4 Ensure permissions on all logfiles are configured 

notify {"4.2.1.1 Ensure rsyslog Service is enabled":}
notify {"4.2.1.2 Ensure logging is configured":}
#notify {"4.2.1.3 Ensure rsyslog default file permissions configured":}

file_line { "(4.2.1.3) - Ensure rsyslog default file permissions configured":
  ensure    => present,
  path      => '/etc/rsyslog.conf',
  line      => '$FileCreateMode 0640',
  match     => '^$FileCreateMode',
}

notify {"4.2.1.4 Ensure rsyslog is configured to send logs to a remote log host":}
notify {"4.2.1.5 Ensure remote rsyslog messages are only accepted on designated log hosts":}
notify {"4.2.2.1 Ensure syslog-ng service is enabled ":}
notify {"4.2.2.2 Ensure logging is configured":}
notify {"4.2.2.3 Ensure syslog-ng default file permissions configured":}
notify {"4.2.2.4 Ensure syslog-ng is configured to send logs to a remote log host":}
notify {"4.2.2.5 Ensure remote syslog-ng messages are only accepted on designated log hosts":}
notify {"4.2.3 Ensure rsyslog or syslog-ng is installed":}
#notify {"4.2.4 Ensure permissions on all logfiles are configured ":}

#fix file permissions of odd files
file { '(4.2.4) Ensure permissions on all logfiles are configured boot.log':
  ensure => file,
  path   => '/var/log/boot.log',
  mode   => '0600',
  owner  => 'root',
  group  => 'root',
}

file { '(4.2.4) Ensure permissions on all logfiles are configured btmp':
  ensure => file,
  path   => '/var/log/btmp',
  mode   => '0600',
  owner  => 'root',
  group  => 'root',
}

file { '(4.2.4) Ensure permissions on all logfiles are configured dmesg':
  ensure => file,
  path   => '/var/log/dmesg',
  mode   => '0600',
  owner  => 'root',
  group  => 'root',
}

file { '(4.2.4) Ensure permissions on all logfiles are configured lastlog':
  ensure => file,
  path   => '/var/log/lastlog',
  mode   => '0600',
  owner  => 'root',
  group  => 'root',
}

file { '(4.2.4) Ensure permissions on all logfiles are configured wtmp':
  ensure => file,
  path   => '/var/log/wtmp',
  mode   => '0600',
  owner  => 'root',
  group  => 'root',
}

} #EOF

