#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int num;

    // Проверяем, передан ли аргумент (имя программы + само число)
    if (argc < 2) {
        printf("Введите целое число: ");
        if (scanf("%d", &num) != 1) {
            exit(3);
        }
    } else {
        // Пытаемся преобразовать аргумент в число
        char *endptr;
        num = strtol(argv[1], &endptr, 10);

        // Если после числа остались символы или ввод был пустым
        if (*endptr != '\0') {
            exit(3);
        }
    }

    if (num > 0) {
        exit(1);
    } else if (num < 0) {
        exit(2);
    } else {
        exit(0);
    }
}
