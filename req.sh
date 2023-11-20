#!/bin/bash
# Запрашиваем у пользователя число
echo "Введите число от 0 до 9:"
read num

# Проверяем, что число находится в диапазоне от 0 до 9
if [ $num -lt 0 || $num -gt 9 ]; then
    echo "Вы ввели неверное число. Попробуйте еще раз."
else
    # Если число меньше или равно 0, то выводим 0 строк
    if [ $num -eq 0 ]; then
        echo ""
    else
        # Иначе выводим строку, содержащую заданное число
        for i in $(seq -w $num); do
            echo "$((i + 1)) $((i + 1)) $((i + 1))"
        done
    fi
fi


    # - ip: 10.10.1.96 #
    #   port: 14000
    #   tags:
    #     src_hostname: Master-node
    #     dst_hostname: node-$var