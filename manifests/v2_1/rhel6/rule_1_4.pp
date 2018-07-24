# == Class: linux_cis::v2_1::rhel6::rule_1_4
# includes Rules:
# 1.4.1 - Ensure permissions on bootloader config are configured  (Scored)
# NOT USED 1.4.2 - Ensure bootloader password is set 
# NOT USED 1.4.3 - Ensure authentication required for single user mode 

class linux_cis::v2_1::rhel6::rule_1_4 {
  #1.4.1
  file { '/boot/grub/grub.conf' :
    ensure => file,
    mode   => '0600',
    owner  => 'root',
    group  => 'root',
  }

#  notify {"NOT USED 1.4.2 - Ensure bootloader password is set ": loglevel => "debug"}
#  notify {"NOT USED 1.4.3 - Ensure authentication required for single user mode ": loglevel => "debug"}
}
