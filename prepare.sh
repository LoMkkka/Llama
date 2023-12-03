#!/bin/bash

# Установка openstack CLI
sudo apt install python3-openstackclient -y
# Установка Ansible
sudo apt install ansible -y
# Установка Terraform
sudo snap install terraform --classic 
# Перенос утилиты 
cp /root/Llama/files/terraform-inventory /usr/local/bin
# Генерация ssh ключа
ssh-keygen
# Зеркало
cp /root/Llama/files/.terraformrc ~/
### Передача ssh ключа в переменную для master  
ssh_key_path=`cat ~/.ssh/id_rsa.pub`
echo $ssh_key_path
word="put" 
file="/root/Llama/terraform/master/vars.tf"
sed -i "s#$word#$ssh_key_path#" "$file"
