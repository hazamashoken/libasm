#include "list.h"

int	ft_list_size(t_list *begin_list)
{
	int i;

	t_list *list_next;

	i = 0;
	while (begin_list)
	{
		list_next = begin_list->next;
		begin_list = list_next;
		i++;
	}
	return(i);
}