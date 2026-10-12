#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 <command_name>"
    exit 1
fi

MAN_DIR="/usr/share/man/man1"
TARGET="$1"

# Ищем файл (сжатый .gz или не сжатый)
FILE=$(find "$MAN_DIR" -maxdepth 1 -type f -name "${TARGET}.*" 2>/dev/null | head -n 1)

if [ -z "$FILE" ]; then
    echo "Справка для команды '$TARGET' не найдена."
    exit 1
fi

# Передаем файл в less. --use-lesspipe позволяет less самому распаковывать .gz
less "$FILE"
