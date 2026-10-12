#!/bin/bash

# 1. Проверка аргументов
if [ $# -ne 2 ]; then
    echo "Использование: $0 <директория> <имя_архива.tar.gz>"
    exit 1
fi

SOURCE_DIR="$1"
ARCHIVE_NAME="$2"

# 2. Проверка существования директории
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Ошибка: директория '$SOURCE_DIR' не найдена."
    exit 1
fi

# 3. Поиск и архивация
# -maxdepth 1: не заходим в подпапки
# -type f: ищем только файлы
# -mtime -7: измененные менее 7 дней назад (минус означает "меньше чем")
# -print0: защита от пробелов в именах файлов
echo "Ищу файлы в '$SOURCE_DIR', измененные за последнюю неделю..."

find "$SOURCE_DIR" -maxdepth 1 -type f -mtime -7 -print0 | tar --null -czf "$ARCHIVE_NAME" -T -

if [ $? -eq 0 ]; then
    echo "Архив '$ARCHIVE_NAME' успешно создан."
else
    echo "Ошибка при создании архива."
    exit 1
fi
