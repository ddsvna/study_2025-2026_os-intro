#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <length>"
    exit 1
fi

LEN=$1
RESULT=""

for ((i=0; i<LEN; i++)); do
    # Генерируем число от 97 ('a') до 122 ('z')
    CODE=$(( RANDOM % 26 + 97 ))
    # Преобразуем код символа в сам символ и добавляем к строке
    CHAR=$(printf "\\$(printf '%03o' "$CODE")")
    RESULT+="$CHAR"
done

echo "Случайная строка: $RESULT"
