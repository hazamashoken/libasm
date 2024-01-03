#include "list_bonus.h"

void	ft_swap_void(void **a, void **b)
{
	void	*c;

	c = *a;
	*a = *b;
	*b = c;
}

// void ft_list_sort(t_list **begin_list, int (*cmp)())
// {
//     t_list *current;
//     t_list *end = NULL;
//     int swapped;

//     if (*begin_list == NULL)
//         return;

//     do
//     {
//         swapped = 0;
//         current = *begin_list;

//         while (current->next != end)
//         {
//             if ((*cmp)(current->data, current->next->data) > 0)
//             {
//                 ft_swap_void(&(current->data), &(current->next->data));
//                 swapped = 1;
//             }

//             current = current->next;
//         }

//         end = current;
//     } while (swapped);
// }

void	ft_list_sort(t_list **begin_list, int (*cmp)(void *, void *))
{
	t_list	*current;
	t_list	*end;
	int	swapped;

	if (*begin_list == 0)
		return ;
	swapped = 1;
	end = 0;
	while (swapped)
	{
		swapped = 0;
		current = *begin_list;
		while (current->next != end)
		{
			if ((*cmp)(current->data, current->next->data) > 0)
			{
				ft_swap_void(&(current->data), &(current->next->data));
				swapped = 1;
			}
			current = current->next;
		}
		end = current;
	}
}