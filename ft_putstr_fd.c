/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_putstr_fd.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msavelie <msavelie@student.hive.fi>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/22 16:15:56 by msavelie          #+#    #+#             */
/*   Updated: 2025/03/03 11:48:28 by msavelie         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_putstr_fd(char *s, int fd)
{
	int	i;

	if (!s)
	{
		if (write(1, "(null)", 6) < 0)
			return (-1);
		return (6);
	}
	i = 0;
	while (s[i])
		i++;
	write(fd, s, i);
	return (i);
}
