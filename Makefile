# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyna <hyna@student.42seoul.kr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/27 17:21:21 by hyna              #+#    #+#              #
#    Updated: 2022/03/27 18:13:54 by hyna             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

CCFLAGS = -Wall -Werror -Wextra

LIBFT = -L./libft -lft

SRCS = #write the names of source files

OBJS = $(SRCS:.c=.o)

all = $(NAME)

$(NAME) : $(OBJS)
	cp ./libft/libft.a $(NAME)
	ar rcs $(NAME) $<

%.o : %.c
	cc $(CCFLAGS) -c $< -o $@

clean :
	@$(MAKE) -C ./libft clean
	rm -rf $(OBJS)

fclean : clean
	@$(MAKE) -C ./libft fclean
	rm -rf $(NAME)

re : fclean all

#compile libft

libft :
	@$(MAKE) -C ./libft all

.PHONY : all bonus clean fclean re libft
