#!/bin/bash
# Установка Ansible
apt install ansible -y
# Установка Terraform
snap install terraform --classic 
# Перенос утилиты 
mv terraform-inventory /usr/local/bin
# Генерация ssh ключа
ssh-keygen
# Зеркало
mv .terraformrc ~/
### Передача ssh ключа в переменную для master  
ssh_key_path=`cat ~/.ssh/id_rsa.pub`
echo $ssh_key_path
word="put" 
file="/root/Llama/terraform/master/vars.tf"
sed -i "s#$word#$ssh_key_path#" "$file"