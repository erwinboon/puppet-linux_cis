# == Class: linux_cis::v2_1::rhel6::rule_1_5
# includes Rules:
#1.5.1 Ensure core dumps are restricted
#NOT USED 1.5.2 Ensure XD/NX support is enabled
#1.5.3 Ensure address space layout randomization (ASLR) is enabled 
#1.5.4 Ensure prelink is disabled (Scored

class linux_cis::v2_1::rhel6::rule_1_5 {
  $file = '/etc/security/limits.conf'

  #1.5.1
  file { "(1.5.1) - ${file} exists":
    ensure => file,
    path   => $file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
  }
  file_line { "(1.5.1) - ${file}: disable core dumps":
    ensure => present,
    path   => $file,
    line   => '* hard core 0',
  }
  sysctl { 'fs.suid_dumpable':
    ensure => present,
    value  => '0',
  }

  #1.5.2
  #  notify {"#NOT USED 1.5.2 Ensure XD/NX support is enabled": loglevel => "debug"}
  
  #1.5.3
  sysctl { 'kernel.randomize_va_space':
    ensure  => present,
    value   => '2',
  }
  
  #1.5.4
  service {'1.5.4 Ensure prelink is disabled':
    ensure => stopped,
    name   =>'prelink',
  }
  package { '1.5.4 Ensure prelink is removed' :
    ensure => absent,
    name   => 'prelink',
  }
}
