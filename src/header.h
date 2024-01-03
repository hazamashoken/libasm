# ifndef HEADER_H
#  define HEADER_H

#include <stddef.h>
#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>


# ifndef BONUS
#  define BONUS 0
    void test_bonus(int * a, int* b)
    {
        (void)a;
        (void)b;
    };
#  else
#   include "bonus/list_bonus.h"
    void test_bonus(int * a, int* b);
# endif

size_t ft_strlen(const char *s);
char *ft_strcpy(char * dst, const char * src);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *s);
# endif