#!/bin/bash

# 1. Проверка аргумента
if [ $# -ne 1 ]; then
    echo "Использование: $0 <количество_файлов>"
    exit 1
fi

COUNT=$1

# 2. Проверка, что аргумент — это число
if ! [[ "$COUNT" =~ ^[0-9]+$ ]]; then
    echo "Ошибка: аргумент должен быть положительным числом."
    exit 1
fi

# 3. Выбор действия
PS3="Выберите действие (введите 1 или 2): "
select ACTION in "Создать файлы" "Удалить файлы"; do
    case $ACTION in
        "Создать файлы")
            echo "Создаем $COUNT файлов..."
            for i in $(seq 1 $COUNT); do
                touch "${i}.tmp"
            done
            echo "Готово."
            break
            ;;
        "Удалить файлы")
            echo "Удаляем файлы..."
            for i in $(seq 1 $COUNT); do
                # Проверяем существование перед удалением
                if [ -e "${i}.tmp" ]; then
                    rm "${i}.tmp"
                fi
            done
            echo "Готово."
            break
            ;;
        *) 
            echo "Неверный выбор. Введите 1 или 2."
            ;;
    esac
done
