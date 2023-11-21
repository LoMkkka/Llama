#!/bin/bash
terraform-inventory -inventory ./terraform > ~/Llama/ansible/hosts.ini
jump_ip=`sed -n '/\[module_master_fip_tf\]/,+1p'  ansible/hosts.ini | sed -n '2p'`
echo "Host 10.10.1.*
    StrictHostKeyChecking no
    User root
    ProxyJump root@$jump_ip" >  ~/.ssh/config



ssh_key_path=`cat ~/.ssh/id_rsa.pub`
echo $ssh_key_path
word="put"
file="/root/Llama/terraform/master/vars.tf"
sed -i "s#$word#$ssh_key_path#" "$file"

