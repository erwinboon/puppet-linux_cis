# perfecto25-cis_rhel7
# Yum Available Updates (CIS 1.2.5)

require 'facter'

Facter.add('cis_yum_updates') do
	confine :osfamily => 'RedHat'
	setcode do
		key = Facter::Core::Execution.exec('/tmp/cis_scripts/cis_yumupdates.sh')
	end
			
end