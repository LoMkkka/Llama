#!/bin/bash

# Проверяем наличие аргументов
# if [ "$#" -ne 2 ]; then
#     echo "Использование: $0 <файл> <слово_для_замены>"
#     exit 1
# fi




# put_master_ip
# # Считываем аргументы
# file1="text.txt"
# file2="ss.txt"
# word_to_replace="put_master_ip"
# word_to_input=`sed -n '/\[module_master_server_tf\]/,+1p'  abvg.txt | sed -n '2p'`
# # Проверяем, существует ли файл
# if [ ! -e "$file1" ]; then
#     echo "Файл $file1 не найден."
#     exit 1
# fi
# # Заменяем слово в файле и сохраняем изменения
# sed -i "s/\b$word_to_replace\b/$word_to_input/g" "$file1" >> "$file2" 


# Пример списка 1
readarray list1 < 

# Пример списка 2
list2=("red" "yellow" "purple")

# Получаем количество элементов в первом списке
length=${#list1[@]}

# Итерируем по индексам списков
for ((i=0; i<$length; i++)); do
    element1="${list1[$i]}"
    element2="${list2[$i]}"
    
    echo "Element 1: $element1, Element 2: $element2"
done
