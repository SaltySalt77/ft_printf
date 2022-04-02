/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hyna <hyna@student.42seoul.kr>             +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/03/27 20:53:56 by hyna              #+#    #+#             */
/*   Updated: 2022/04/02 19:12:54 by hyna             ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "ft_printf.h"

static int	conversion_c(va_list	ap)
{
	int		result;
	char	c;

	c = va_arg(ap, int);
	result = write(1, &c, 1);
	return (result);
}

static int	which_conversion(char	*c, va_list ap)
{
	int	result;

	if (c == 'c')
		result = conversion_c(ap);
	/*else if (c == 's')
		result = conversion_s();
	else if (c == 'p')
		result = conversion_p();
	else if (c == 'd')
		result = conversion_d();
	else if (c == 'i')
		result = conversion_i();
	else if (c == 'u')
		result = conversion_u();
	else if (c == 'x')
		result = conversion_x();
	else if (c == 'X')
		result = conversion_upper_x();
	else
	{
		result = write(1, "%", 1);
		result += write(1, &c, 1);
	}
	*/
	return (result);
}

static int	check_format(const char	*format, va_list ap)
{
	int	result;
	int	i;
	int tmp;

	result = 0;
	i = 0;
	while (format[i])
	{
		if (format[i] == '%')
		{
			tmp = which_conversion(format[++i], ap);
			if (tmp == -1)
				return (-1);
			i++;
			result += tmp;
		}
		else
		{
			write(1, &(format[i]), 1);
			result++;
			i++;
		}
	}
	return (result);
}

int	ft_printf(const char	*format, ...)
{
	va_list	ap;
	int	    result;

	va_start(ap, format);
	result = check_fromat(format, ap);
	va_end(ap);
	if (result == -1)
		return (-1);
	return (result);
}
