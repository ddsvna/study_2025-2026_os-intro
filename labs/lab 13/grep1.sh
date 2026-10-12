#!/bin/bash

# Обнуление переменных для хранения параметров
INPUT_FILE=""
OUTPUT_FILE=""
PATTERN=""
CASE_SENSITIVE=false
LINE_NUMBERS=false

# 1. Разбор ключей командной строки
# i:, o:, p: — требуют аргумента; C, n — флаги-переключатели
while getopts "i:o:p:Cn" opt; do
  case $opt in
    i) INPUT_FILE="$OPTARG" ;;      # Входной файл
    o) OUTPUT_FILE="$OPTARG" ;;     # Выходной файл
    p) PATTERN="$OPTARG" ;;         # Шаблон поиска
    C) CASE_SENSITIVE=true ;;       # Флаг: различать регистр
    n) LINE_NUMBERS=true ;;         # Флаг: показывать номера строк
    \?) exit 1 ;;                   # Ошибка: неизвестный ключ
  esac
done

# 2. Проверка обязательных аргументов (входной файл и шаблон)
if [ -z "$INPUT_FILE" ] || [ -z "$PATTERN" ]; then
    echo "Использование: $0 -i<inputfile> -p<шаблон> [-o<outputfile>] [-C] [-n]"
    exit 1
fi

# 3. Проверка существования входного файла
if [ ! -f "$INPUT_FILE" ]; then
    echo "Ошибка: файл '$INPUT_FILE' не найден."
    exit 1
fi

# 4. Сборка флагов для команды grep
GREP_FLAGS=""

# Если -C не задан, ищем без учета регистра (-i)
if [[ "$CASE_SENSITIVE" != true ]]; then
    GREP_FLAGS+="-i "
fi

# Если задан флаг -n, добавляем его
if [[ "$LINE_NUMBERS" == true ]]; then
    GREP_FLAGS+="-n "
fi

# 5. Выполнение поиска
# Если указан выходной файл — перенаправляем результат туда
if [ -n "$OUTPUT_FILE" ]; then
    grep $GREP_FLAGS "$PATTERN" "$INPUT_FILE" > "$OUTPUT_FILE"
    echo "Результаты сохранены в $OUTPUT_FILE"
else
    # Иначе выводим на экран
    grep $GREP_FLAGS "$PATTERN" "$INPUT_FILE"
fi
