#!/bin/bash

#Каталог для резервных копий
BACKUP_DIR="$HOME/backup"

# Создание каталога backup, если его нет
mkdir -p "$BACKUP_DIR"

# Имя текущего скрипта
SCRIPT_NAME=$(basename "$0")

# Полный путь к текущему скрипту
SCRIPT_PATH=$(realpath "$0")

# Имя архива с датой и временем
ARCHIVE_NAME="${SCRIPT_NAME}_$(date +%Y-%m-%d_%H-%M-%S).tar.gz"

# Создание архива
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" "$SCRIPT_PATH"

echo "Резервная копия создана:"
echo "$BACKUP_DIR/$ARCHIVE_NAME"
