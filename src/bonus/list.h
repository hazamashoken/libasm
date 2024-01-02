#ifndef LIST_H
# define LIST_H


# include <stdlib.h>
# include "../header.h"

typedef struct  s_list
{
void *data;
struct s_list   *next;
}               t_list;


int ft_atoi_base(char *str, char *base);


#endif