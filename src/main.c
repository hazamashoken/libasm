#include "header.h"
#include <stdio.h>
#include <errno.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>

int failed = 0;
int test_count = 0;

void test_strlen(const char * str)
{
    test_count++;
    size_t ft_len = ft_strlen(str);
    size_t len = strlen(str);
    if (ft_len == len)
        printf("ft_strlen: \x1b[32mOK\n");
    else
    {
        printf("ft_strlen: \x1b[31mKO\n");
        failed++;
    }
    printf("string: %s\n", str);
    printf("strlen: %lu\n", len);
    printf("ft_strlen: %lu\033[0m\n\n", ft_len);
}

void test_strcpy(const char *str, size_t len)
{
    test_count++;
    char *ft_dst = malloc(sizeof(char) * len);
    char *dst = malloc(sizeof(char) * len);
    ft_strcpy(ft_dst, str);
    strcpy(dst, str);
    if (strcmp(ft_dst, dst) == 0)
        printf("ft_strcpy: \x1b[32mOK\n\n");
    else
    {
        printf("ft_strcpy: \x1b[31mKO\n\n");
        failed++;
    }
    printf("string: %s\n", str);
    printf("strcpy: %s\n", dst);
    printf("ft_strcpy: %s\033[0m\n\n", ft_dst);
    free(ft_dst);
    free(dst);

}

void test_strcmp(const char *str1, const char *str2)
{
    test_count++;
    int ft_cmp = ft_strcmp(str1, str2);
    int cmp = strcmp(str1, str2);
    if (ft_cmp == cmp)
        printf("ft_strcmp: \x1b[32mOK\n\n");
    else
    {
        printf("ft_strcmp: \x1b[31mKO\n\n");
        failed++;
    }
    printf("string1: %s\n", str1);
    printf("string2: %s\n", str2);
    printf("strcmp: %d\n", cmp);
    printf("ft_strcmp: %d\033[0m\n\n", ft_cmp);
}

void test_strdup(const char *str)
{
    test_count++;
    char *ft_dup = ft_strdup(str);
    char *dup = strdup(str);
    if (strcmp(ft_dup, dup) == 0)
        printf("ft_strdup: \x1b[32mOK\n\n");
    else
    {
        printf("ft_strdup: \x1b[31mKO\n\n");
        failed++;
    }
    printf("string: %s\n", str);
    printf("strdup: %s\n", dup);
    printf("ft_strdup: %s\033[0m\n\n", ft_dup);
    free(ft_dup);
    free(dup);
}

void test_write(int fd, const void *buf, size_t count)
{
    test_count++;
    write(1, "ft_write: >", 12);
    ssize_t ft_write_size = ft_write(fd, buf, count);
    write(1, "<\nwrite: >", 11);
    ssize_t write_size = write(fd, buf, count);
    write(1, "<\n", 2);
    if (ft_write_size == write_size)
        printf("ft_write: \x1b[32mOK\n\n");
    else
    {
        printf("ft_write: \x1b[31mKO\n\n");
        failed++;
    }
    printf("fd: %d\n", fd);
    printf("buf: %s\n", (char *)buf);
    printf("count: %lu\n", count);
    printf("write: %ld\n", write_size);
    printf("ft_write: %ld\033[0m\n\n", ft_write_size);
}

void test_read(const char* filepath, size_t file_size)
{
    test_count++;
    int ft_read_size;
    int read_size;
    int fd = open(filepath, O_RDONLY);
    if (fd == -1)
    {
        printf("Error: %s\n", strerror(errno));
        return;
    }
    char *ft_buf = malloc(sizeof(char) * file_size);
    char *buf = malloc(sizeof(char) * file_size);
    read_size = read(fd, buf, file_size);
    lseek(fd, 0, SEEK_SET);
    ft_read_size = ft_read(fd, ft_buf, file_size);
    if (strcmp(ft_buf, buf) == 0)
        printf("ft_read: \x1b[32mOK\n\n");
    else
    {
        printf("ft_read: \x1b[31mKO\n\n");
        failed++;
    }
    printf("filepath: %s\n", filepath);
    printf("file_size: %lu\n", file_size);
    printf("read (%d): %s\n", read_size, buf);
    printf("ft_read (%d): %s\033[0m\n\n", ft_read_size, ft_buf);
    free(ft_buf);
    free(buf);
}

int main(void){
   // testing ft_strlen
    test_strlen("");
    test_strlen("Hello");
    test_strlen("Hello World!");
    test_strlen(">       <");
    // NULL will cause a segfault
    // test_strlen(NULL);

    // testing ft_strcpy
    test_strcpy("Hello", 6);
    test_strcpy("Hello World!", 13);
    test_strcpy(">       <", 11);
    test_strcpy("", 1);

    // NULL will cause a segfault
    // test_strcpy(NULL, 0);

    // testing ft_strcmp
    test_strcmp("Hello", "Hello");
    test_strcmp("Hello", "Hello World!");
    test_strcmp("Hello World!", "Hello");
    test_strcmp("Hello", "");
    test_strcmp("", "Hello");
    test_strcmp("", "");

    // NULL will cause a segfault
    // test_strcmp("Hello", NULL);
    // test_strcmp(NULL, "Hello");
    // test_strcmp(NULL, NULL);

    // testing ft_strdup
    test_strdup("Hello");
    test_strdup("Hello World!");
    test_strdup(">       <");
    test_strdup("");

    // testing write
    test_write(1, "Hello", 6);
    test_write(1, "Hello World!", 13);
    test_write(1, ">       <", 11);
    test_write(1, "", 1);

    // testing read
    // creating mock files


    int test_fd_1 = open(".test_file_1.txt", O_TRUNC | O_CREAT | O_RDWR, 0664);
    if (test_fd_1 == -1)
    {
        printf("Error: %s\n", strerror(errno));
        return 1;
    }
    write(test_fd_1, "Hello", 6);
    close(test_fd_1);
    test_fd_1 = open(".test_file_1.txt", O_RDONLY);
    test_read(".test_file_1.txt", 6);
    close(test_fd_1);
    unlink(".test_file_1.txt");


    int test_fd_2 = open(".test_file_2.txt", O_TRUNC | O_CREAT | O_RDWR, 0664);
    if (test_fd_2 == -1)
    {
        printf("Error: %s\n", strerror(errno));
        return 1;
    }
    write(test_fd_2, "Hello World!", 13);
    close(test_fd_2);
    test_fd_2 = open(".test_file_2.txt", O_RDONLY);
    test_read(".test_file_2.txt", 13);
    close(test_fd_2);
    unlink(".test_file_2.txt");

    int test_fd_3 = open(".test_file_3.txt", O_TRUNC | O_CREAT | O_RDWR, 0664);
    if (test_fd_3 == -1)
    {
        printf("Error: %s\n", strerror(errno));
        return 1;
    }
    write(test_fd_3, "", 1);
    close(test_fd_3);
    test_fd_3 = open(".test_file_3.txt", O_RDONLY);
    test_read(".test_file_3.txt", 1);
    close(test_fd_3);
    unlink(".test_file_3.txt"); 
    
    // test_read(0, 100);

    // Pass or fail
    printf("%d\n", BONUS);
    if (BONUS)
        printf("\x1b[33mBonus part is not implemented yet!\033[0m\n");
    if (failed == 0)
        printf("\x1b[32mAll Mandatory tests passed! [%d/%d]\033[0m\n", test_count - failed, test_count);
    else
        printf("\x1b[31mSome tests failed! [%d/%d]\033[0m\n", test_count - failed, test_count);

    return 0;
}