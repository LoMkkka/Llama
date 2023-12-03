#!/bin/bash
temp_file=$(mktemp)
path_hosts="/root/Llama/ansible/hosts.ini"
# Утилита формирует список групп с ip в inventory в указанный файл.
cd ~/Llama/terraform
terraform-inventory -inventory /root/Llama/terraform > $path_hosts
# После чего создаем jump
jump_ip=`sed -n '/\[module_master_fip_tf\]/,+1p' $path_hosts | sed -n '2p'`
echo "Host 10.10.1.*
    StrictHostKeyChecking no
    User root
    ProxyJump root@$jump_ip" >  ~/.ssh/config

# Здесь идет настройка для llama.config collector
# Controls how ports are setup for sending probes
file1="/root/Llama/files/abvg.txt" # шаблон
file2="/root/Llama/files/complex_example.yaml" # шаблон config для collector
word_to_replace="put_ip_master"
word_to_input=`sed -n '/\[module_master_server_tf\]/,+1p'  $path_hosts | sed -n '2p'`
# Проверяем, существует ли файл
if [ ! -e "$file1" ]; then
    echo "Файл $file1 не найден."
    exit 1
fi
# Заменяем слово в файле и сохраняем изменения
sed  "s/\b$word_to_replace\b/$word_to_input/g" "$file1" > "$file2" 

#Если при пересборки terraform выдаст тот же ip для master, то не будет головной боли с вручным вводом для удаления из known_hosts
headache=`sed -n '/\[type_openstack_compute_floatingip_associate_v2\]/,+1p' $path_hosts | sed -n '2p'`
ssh-keygen -f "/root/.ssh/known_hosts" -R "$headache"

### Адрес ноды и ее порт в который нужно пинговать
echo Введите количество нод
read num
# Выбирает нужный промежуток в host.ini, где хранятся ip нужных нам нод
hosts=`sed -n '/\[module_nodes_server_tf\]/,/\[module_nodes_server_tf_0\]/{p;/\ \
[module_nodes_server_tf_0\]/q}' "$path_hosts" | sed -n "2,$((num+1))p" `
readarray list1 <<< $hosts
readarray list2 <<< "$(seq $num)"
# Получаем количество элементов в первом списке
length=${#list1[@]}
# Итерация по индексам списка
for ((i=0; i<$length; i++)); do
    element1="${list1[$i]}"
    element2="${list2[$i]}"
    echo -n "
    - ip: $element1      port: 14000
      tags:
        src_hostname: Master-node
        dst_hostname: node-$((element2))
        "
done > "$temp_file"

# Подстановка в конфиг
insert_text=`cat $temp_file`
awk -v line=63 -v text="$insert_text" '{
  if (NR == line) {
    print text
  }
  print $0
}' "$file2" > "/root/Llama/ansible/docker-llama/collector/files/complex_example.yaml"
