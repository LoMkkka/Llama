#!/bin/bash
#snap install terraform
# Запрашиваем у пользователя число
"host.txt"
file=`cat host.txt`
echo "Введите число от 0 до 9:"
read num 
# ip=`sed -n "$num p" $file1`
# echo $ip

# for ip in $file; do 
#     echo $ip
#     done
# Проверяем, что число находится в диапазоне от 0 до 9



if [[ $num -lt 0 || $num -gt 20 ]]; then
    echo "Вы ввели неверное число. Попробуйте еще раз."
else
    # Если число меньше или равно 0, то выводим 0 строк
    if [ $num -eq 0 ]; then
        echo ""
    else
        # Иначе выводим строку, содержащую заданное число
        for i in $(seq $num); do
        for ip in $file; do 
            echo -n "
    - ip: $ip
      port: 14000
      tags:
        src_hostname: Master-node
        dst_hostname: node-$((i))"
        done #>> complex_example.yaml
        echo
        done
    fi
fi