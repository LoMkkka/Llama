#!/bin/bash
apt install ansible -y
snap install terraform --classic
mv terraform-inventory /usr/local/bin
ssh-keygen
mv .terraformrc ~/
ssh_key_path=`cat ~/.ssh/id_rsa.pub`
echo $ssh_key_path
word="put" #обдумать
file="/root/Llama/terraform/master/vars.tf"
sed -i "s#$word#$ssh_key_path#" "$file"