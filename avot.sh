#!/bin/bash

terraform-inventory -inventory ./terraform > ~/Llama/ansible/hosts.ini
jump_ip=`sed -n '/\[module_master_fip_tf\]/,+1p'  ansible/hosts.ini | sed -n '2p'`
echo "Host 10.10.1.*
    StrictHostKeyChecking no
    User root
    ProxyJump root@$jump_ip" >  ~/.ssh/config

Считываем аргументы
file1="abvg.txt"
file2="ss.txt"
word_to_replace="put_ip_master"
word_to_input=`sed -n '/\[module_master_server_tf\]/,+1p'  hosts.ini | sed -n '2p'`
echo $word_to_input
# Проверяем, существует ли файл
if [ ! -e "$file1" ]; then
    echo "Файл $file1 не найден."
    exit 1
fi
# Заменяем слово в файле и сохраняем изменения
sed  "s/\b$word_to_replace\b/$word_to_input/g" "$file1" >> "$file2" 
echo Введитек количество нод
read num
# hosts=`sed -n '/\[module_nodes_server_tf\]/p'  hosts.txt  | sed -n 'p' ` 
# echo $hosts
file="hosts.txt"
a="[module_nodes_server_tf]"
b="[module_nodes_server_tf_0]"
#echo `sed  "/$a/,/$b/p" "$file" | sed -n 'p' `
sed -n '/\[module_nodes_server_tf\]/,/\[module_nodes_server_tf_0\]/{p;/\[module_nodes_server_tf_0\]/q}' "$file" | sed -n "2,$((num+1))p"
readarray list1 <<< $hosts
readarray list2 <<< "$(seq $num)"
# Получаем количество элементов в первом списке
length=${#list1[@]}
#Итерация по индексам списка
for ((i=0; i<$length; i++)); do
    element1="${list1[$i]}"
    element2="${list2[$i]}"
    echo -n "
    - ip: $element1      port: 14000
      tags:
        src_hostname: Master-node
        dst_hostname: node-$((element2))
        " 
done
