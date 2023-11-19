#!/bin/bash
terraform-inventory -inventory . > test.txt
sed -i '/\[all:vars\]/a ansible_ssh_user=root'  test.txt
sed -in 'H;${;s/ProxyJump .*$/ProxyJump root@46.161.52.224/}' ~/.ssh/config #аргумент
