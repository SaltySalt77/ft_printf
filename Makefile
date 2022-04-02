# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyna <hyna@student.42seoul.kr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/27 17:21:21 by hyna              #+#    #+#              #
#    Updated: 2022/04/02 20:14:50 by hyna             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
CCFLAGS = -Wall -Werror -Wextra
SRCS = ft_printf.c \
	   print_in_conversions1.c \

OBJS = $(SRCS:.c=.o)

all : $(NAME)

$(NAME) : $(OBJS) libft
	cp ./libft/libft.a ./$(NAME)
	ar rcs $(NAME) $(OBJS)

%.o : %.c
	cc $(CCFLAGS) -c $< -o $@

libft :
	@$(MAKE) -C ./libft all

clean :
	@$(MAKE) -C ./libft clean
	rm -rf $(OBJS)

fclean : clean
	rm -rf ./libft/libft.a
	rm -rf $(NAME)

re : fclean all
	
test : re
	cc main.c $(NAME)

.PHONY : all clean fclean re libft
