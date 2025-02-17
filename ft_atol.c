/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atol.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msavelie <msavelie@student.hive.fi>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/02/17 15:21:41 by msavelie          #+#    #+#             */
/*   Updated: 2025/02/17 15:22:45 by msavelie         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

static long	check_range(long num, long sign, const char *str)
{
	long	check;

	while ((*str >= '0' && *str <= '9') && *str)
	{
		check = (long)(num * 10 + *str - '0');
		if ((check == LONG_MAX || check == LONG_MIN) && sign == -1)
			return (LONG_MIN);
		if (check == LONG_MAX && sign == 1)
			return (LONG_MAX);
		if (check / 10 != num && sign == 1)
			return (-1);
		if (check / 10 != num && sign == -1)
			return (0);
		num = check;
		str++;
	}
	return ((long)(num * sign));
}

long	ft_atol(const char *str)
{
	long			sign;
	long			num;

	num = 0;
	sign = 1;
	while ((*str >= 9 && *str <= 13) || *str == 32)
		str++;
	if (*str == '-' || *str == '+')
	{
		if (*str == '-')
			sign *= -1;
		str++;
	}
	return (check_range(num, sign, str));
}
