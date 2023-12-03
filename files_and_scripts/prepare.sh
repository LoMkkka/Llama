#!/bin/bash

# Установка openstack CLI
sudo apt install python3-openstackclient
# Установка Ansible
sudo apt install ansible -y
# Установка Terraform
sudo snap install terraform --classic 
# Перенос утилиты 
cp terraform-inventory /usr/local/bin
# Генерация ssh ключа
ssh-keygen
# Зеркало
cp .terraformrc ~/
### Передача ssh ключа в переменную для master  
ssh_key_path=`cat ~/.ssh/id_rsa.pub`
echo $ssh_key_path
word="put" 
file="~/Llama/terraform/master/vars.tf"
sed -i "s#$word#$ssh_key_path#" "$file"
