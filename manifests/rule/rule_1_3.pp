class cis_rhel7::rule::rule_1_3 {

#includes Rules:
#NOT USED 1.3.1 Install [AIDE] (Scored)
# NOT USED 1.3.2 Ensure filesystem integrity is regularly checked 

#package { "(1.3.1) - OSSEC CLIENT [AIDE] is installed and running":
#    name    => "ossec-hids",
#    ensure  => running,
#}
#notify {"NOT USED 1.3.1 install AIDE": loglevel => "debug"}

# includes Rules:
# 1.3.2 - Ensure filesystem integrity is regularly checked 
#notify {"NOT USED 1.3.2 Ensure filesystem integrity is regularly checked": loglevel => "debug"}


} #EOF

