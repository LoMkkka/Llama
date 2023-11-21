#!/bin/bash
echo vvedu chislo
read num
# Текстовый файл, в котором будем производить замены
input_file="complex_example.yaml"

# Путь к файлу с результатом замен
output_file="результат.txt"

# Слово для поиска и замены
word_to_replace="node-"
replacement="node-$num"

# Проверка наличия исходного файла
if [ ! -f "$input_file" ]; then
    echo "Ошибка: Исходный файл не найден."
    exit 1
fi

# Чтение файла по словам и замена каждого слова
while read -r line; do
    for word in $line; do
        # Проверка, совпадает ли слово с тем, что нужно заменить
        if [ "$word" = "$word_to_replace" ]; then
            # Замена слова на новое значение
            line="${line//$word/$replacement}"
        fi
    done
    echo "$line" >> "$output_file"
done < "$input_file"

echo "Замена завершена. Результат записан в $output_file"