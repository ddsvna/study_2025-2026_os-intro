#!/bin/bash

EXT=$1
DIR=$2

if [ -z "$EXT" ] || [ -z "$DIR" ]
then
    echo "Ошибка: неправильный запрос"
    echo "Пример использования: ./count_ext.sh .txt /home/user/docs"
    exit 1
fi

if [ ! -d "$DIR" ]
then
    echo "Ошибка: каталог не существует"
    exit 1
fi

COUNT=0

for file in "$DIR"/*"$EXT"
do
    if [ -f "$file" ]
    then
        COUNT=$((COUNT + 1))
    fi
done

echo "Количество файлов формата $EXT: $COUNT"
