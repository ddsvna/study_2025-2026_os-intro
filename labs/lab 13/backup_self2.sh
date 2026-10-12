#!/bin/bash

echo "Количество аргументов: $#"

COUNT=1

for arg in "$@"
do
    echo "Аргумент $COUNT: $arg"
    COUNT=$((COUNT + 1))
done
