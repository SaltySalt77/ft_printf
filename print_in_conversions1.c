/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   print_in_conversions1.c                            :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hyna <hyna@student.42seoul.kr>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/04/02 19:30:04 by hyna              #+#    #+#             */
/*   Updated: 2022/04/02 19:36:19 by hyna             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

int	conversion_c(va_list	ap)
{
	int		result;
	char	c;

	c = va_arg(ap, int);
	result = write(1, &c, 1);
	return (result);
}

int	conversion_s(va_list	ap)
{
	int		result;
	char	*s;

	s = va_arg(ap, char	*);
	result = write(1, s, ft_strlen(s));
	return (result);
}
