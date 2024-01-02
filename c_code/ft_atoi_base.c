#include "list.h"

int	ft_check_base(char *str)
{
	int	i;
	int	j;

	i = 0;
	if (str[0] == '\0' || str[1] == '\0')
		return (0);
	while (str[i] != '\0')
	{
		if ((str[i] >= 9 && str[i] <= 13) || str[i] == ' '
			|| str[i] == '+' || str[i] == '-')
			return (0);
		j = i + 1;
		while (str[j] != '\0')
		{
			if (str[i] == str[j])
				return (0);
			j++;
		}
		i++;
	}
	return (i);
}

int	ft_basenum(char c, char *base)
{
	int	nb;

	nb = 0;
	while (base[nb] != '\0')
	{
		if (c == base[nb])
			return (nb);
		nb++;
	}
	return (-1);
}

int	ft_neg_space(char *str, int *ptr_i)
{
	int	neg;
	int	i;

	i = 0;
	neg = 1;
	while ((str[i] >= 9 && str[i] <= 13) || str[i] == 32)
		i++;
	while ((str[i] != '\0') && (str[i] == 43 || str[i] == 45))
	{
		if (str[i] == 45)
			neg *= -1;
		i++;
	}
	*ptr_i = i;
	return (neg);
}

int	ft_atoi_base(char *str, char *base)
{
	int	i;
	int	neg;
	int	nb1;
	int	nb2;
	int	len;

	nb1 = 0;
	i = 0;
	len = ft_check_base(base);
	if (len >= 2)
	{
		neg = ft_neg_space(str, &i);
		nb2 = ft_basenum(str[i], base);
		while (nb2 != -1)
		{
			nb1 = nb1 * len + nb2;
			i++;
			nb2 = ft_basenum(str[i], base);
		}
		return (nb1 *= neg);
	}
	return (0);
}