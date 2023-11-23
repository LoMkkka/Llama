#!/bin/bash

terraform-inventory -inventory ./terraform > ~/Llama/ansible/hosts.ini
jump_ip=`sed -n '/\[module_master_fip_tf\]/,+1p'  ansible/hosts.ini | sed -n '2p'`
echo "Host 10.10.1.*
    StrictHostKeyChecking no
    User root
    ProxyJump root@$jump_ip" >  ~/.ssh/config


#Считываем аргументы
path_hosts="ansible/hosts.ini"
file1="abvg.txt"
file2="complex_example.yaml"
word_to_replace="put_ip_master"
word_to_input=`sed -n '/\[module_master_server_tf\]/,+1p'  $path_hosts | sed -n '2p'`
echo $word_to_input
# Проверяем, существует ли файл
if [ ! -e "$file1" ]; then
    echo "Файл $file1 не найден."
    exit 1
fi
# Заменяем слово в файле и сохраняем изменения
sed  "s/\b$word_to_replace\b/$word_to_input/g" "$file1" > "$file2" 


echo Введитек количество нод
read num

hosts=`sed -n '/\[module_nodes_server_tf\]/,/\[module_nodes_server_tf_0\]/{p;/\ \
[module_nodes_server_tf_0\]/q}' "$path_hosts" | sed -n "2,$((num+1))p" `
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
done > text3.txt

insert_text=`cat text3.txt`
awk -v line=63 -v text="$insert_text" '{
  if (NR == line) {
    print text
  }
  print $0
}' "$file2" > "text3.txt"