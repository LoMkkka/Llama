#!/bin/bash
ssh_key_path=`cat ~/.ssh/id_rsa.pub`
echo $ssh_key_path
word="put"
file="/root/Llama/terraform/master/vars.tf"
sed -i "s#$word#$ssh_key_path#" "$file"

