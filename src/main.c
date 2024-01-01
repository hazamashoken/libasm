#include <stdio.h>
#include "header.h"
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>

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


    printf("Write: %zd\n", ft_write(1, "Hello\n", 6));
    printf("Write: %zd\n", ft_write(1, "\n", 1));
    printf("Write: %zd\n", ft_write(1, "hello\nworld\n", 12));
    printf("Write: %zd\n", ft_write(1, "Hello world\n", 12));
    ft_write(-5, "error", 5);
    perror("ft_write");

    ft_write(1, "input: ", 7);
    printf("Read: %zd\n", ft_read(0, str, 5));
    printf("read: %s\n", str);
    ft_read(-5, str, 5);
    perror("ft_read");
    const char * const_str = "Hello World!";
    char * str1 = ft_strdup(const_str);
    printf("Strdup: %s\n", str1);
    printf("Strdup: %p\n", str1);
    char * str2 = ft_strdup(const_str);
    printf("Strdup: %s\n",str2);
    printf("Strdup: %p\n",str2);
    perror("ft_strdup");

    free(str1);
    free(str2);

    return 0;
}