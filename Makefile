# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hyna <hyna@student.42seoul.kr>             +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/27 17:21:21 by hyna              #+#    #+#              #
#    Updated: 2022/03/27 20:51:46 by hyna             ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a
CCFLAGS = -Wall -Werror -Wextra
#LIBFT = -L./libft -lft
SRCS = testing.c
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
	@$(MAKE) -C ./libft fclean
	rm -rf $(NAME)

re : fclean all

.PHONY : all clean fclean re libft
