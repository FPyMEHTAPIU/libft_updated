/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcmp.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msavelie <msavelie@student.hive.fi>        +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/12/05 16:58:31 by msavelie          #+#    #+#             */
/*   Updated: 2024/12/05 17:01:04 by msavelie         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_strcmp(const char *s1, const char *s2)
{
	unsigned char	c1;
	unsigned char	c2;
	size_t			n;

	n = ft_strlen(s1);
	if (n != ft_strlen(s2))
		return (-1);
	while (n > 0)
	{
		c1 = (unsigned char) *s1;
		c2 = (unsigned char) *s2;
		if (c1 != c2)
			return (c1 - c2);
		if (c1 == '\0')
			return (0);
		s1++;
		s2++;
		n--;
	}
	return (0);
}
