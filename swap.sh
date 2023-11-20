#!/bin/bash
terraform-inventory -inventory ./modules > ~/test/ansible/hosts.ini
jump_ip=`sed -n '/\[module_master_fip_tf\]/,+1p'  ansible/hosts.ini | sed -n '2p'`
echo "Host 10.10.1.*
    StrictHostKeyChecking no
    User root
    ProxyJump root@$jump_ip" >  ~/.ssh/config