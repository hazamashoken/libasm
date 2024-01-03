#include "list_bonus.h"

void	ft_swap_void(void **a, void **b)
{
    void	*c;

    c = *a;
    *a = *b;
    *b = c;
}

void	ft_list_sort(t_list **begin_list, int (*cmp)(void *, void *))
{
    t_list	*current;
    t_list	*inner;
    t_list	*swap;

    if (!begin_list || !*begin_list || !cmp)
        return ;
    current = *begin_list;
    while (current)
    {
        inner = *begin_list;
        while (inner->next)
        {
            if ((*cmp)(inner->data, inner->next->data) > 0)
            {
                swap = inner->data;
                inner->data = inner->next->data;
                inner->next->data = swap;
            }
            inner = inner->next;
        }
        current = current->next;
    }
}

// void	ft_list_sort(t_list **begin_list, int (*cmp)(void *, void *))
// {
// 	t_list	*current;
// 	t_list	*end;
// 	int	swapped;

// 	if (*begin_list == 0)
// 		return ;
// 	swapped = 1;
// 	end = 0;
// 	while (swapped)
// 	{
// 		swapped = 0;
// 		current = *begin_list;
// 		while (current->next != end)
// 		{
// 			if ((*cmp)(current->data, current->next->data) > 0)
// 			{
// 				ft_swap_void(&(current->data), &(current->next->data));
// 				swapped = 1;
// 			}
// 			current = current->next;
// 		}
// 		end = current;
// 	}
// }