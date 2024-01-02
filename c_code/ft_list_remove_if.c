#include "list.h"

void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)(),
				void (*free_fct)(void *))
{
	t_list	*elem;
	t_list	*prev;

	prev = 0;
	elem = *begin_list;
	while (elem != 0)
	{
		if ((*cmp)(elem->data, data_ref) == 0)
		{
			if (elem == *begin_list)
				*begin_list = elem->next;
			else
				prev->next = elem->next;
			(*free_fct)(elem->data);
			free(elem);
			elem = *begin_list;
		}
		else
		{
			prev = elem;
			elem = elem->next;
		}
	}
}