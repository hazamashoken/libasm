#include <stdio.h>
#include "header.h"
#include <errno.h>

int main(void){
    char str[] = "Hello World!";
    int result;

    printf("Dst before: %s\n", str);
    printf("Src after: %s\n", ft_strcpy(str, "It's me"));
    printf("Dst after: %s\n", str);

    // printf("Result: %i\n", ft_strlen(NULL)); // 0
    printf("Result: %zu\n", ft_strlen("")); // 0
    printf("Result: %zu\n", ft_strlen("1")); // 0
    printf("Result: %zu\n", ft_strlen("12")); // 0
    printf("Result: %zu\n", ft_strlen("123")); // 0
    printf("Result: %zu\n", ft_strlen("1234")); // 0
    printf("Result: %zu\n", ft_strlen("12345")); // 0

    printf("Compare: %d\n", ft_strcmp("Hello", "Hello"));
    printf("Compare: %d\n", ft_strcmp("Hello", "Hell"));
    printf("Compare: %d\n", ft_strcmp("Hell", "Hello"));
    printf("Compare: %d\n", ft_strcmp("", "Hello"));
    printf("Compare: %d\n", ft_strcmp("Hell", ""));


    printf("Write: %zu\n", ft_write(1, "Hello\n", 6));
    printf("Write: %zu\n", ft_write(1, "\n", 1));
    printf("Write: %zu\n", ft_write(1, "hello\nworld\n", 12));
    printf("Write: %zu\n", ft_write(1, "Hello world\n", 12));
    ft_write(5, "error", 5);
    perror("ft_write");

    return 0;
}