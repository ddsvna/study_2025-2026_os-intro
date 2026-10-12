#!/bin/bash

DIR=${1:-.}

if [ ! -d "$DIR" ]
then
    echo "Ошибка: каталог не существует"
    exit 1
fi

echo "Содержимое каталога: $DIR"
echo

for file in "$DIR"/*
do
    name=$(basename "$file")

    if [ -d "$file" ]
    then
        type="Каталог"
    else
        type="Файл"
    fi

    access=""

    [ -r "$file" ] && access="${access} чтение"
    [ -w "$file" ] && access="${access} запись"
    [ -x "$file" ] && access="${access} выполнение"

    echo "$name | $type | Права:$access"
done
