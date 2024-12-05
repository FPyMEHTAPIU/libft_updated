# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: msavelie <msavelie@student.hive.fi>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/17 09:23:09 by msavelie          #+#    #+#              #
#    Updated: 2024/12/05 17:01:15 by msavelie         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# Colors

DEF_COLOR = \033[0;39m
GRAY = \033[0;90m
RED = \033[0;91m
GREEN = \033[0;92m
YELLOW = \033[0;93m
BLUE = \033[0;94m
MAGENTA = \033[0;95m
CYAN = \033[0;96m
WHITE = \033[0;97m

NAME = libft.a

SRCS = \
	ft_isalpha.c \
	ft_isdigit.c \
	ft_isalnum.c \
	ft_isascii.c \
	ft_isprint.c \
	ft_strlen.c \
	ft_memset.c \
	ft_bzero.c \
	ft_memcpy.c \
	ft_memmove.c \
	ft_strlcpy.c \
	ft_strlcat.c \
	ft_toupper.c \
	ft_tolower.c \
	ft_strchr.c \
	ft_strrchr.c \
	ft_strncmp.c \
	ft_memchr.c \
	ft_memcmp.c \
	ft_strnstr.c \
	ft_atoi.c \
	ft_calloc.c \
	ft_strdup.c \
    ft_substr.c \
    ft_strjoin.c \
    ft_strtrim.c \
    ft_split.c \
    ft_itoa.c \
    ft_strmapi.c \
    ft_striteri.c \
    ft_putchar_fd.c \
    ft_putstr_fd.c \
    ft_putendl_fd.c \
    ft_putnbr_fd.c \
	ft_lstnew_bonus.c \
	ft_lstadd_front_bonus.c \
	ft_lstsize_bonus.c \
	ft_lstlast_bonus.c \
	ft_lstadd_back_bonus.c \
	ft_lstdelone_bonus.c \
	ft_lstclear_bonus.c \
	ft_lstiter_bonus.c \
	ft_lstmap_bonus.c \
	get_next_line_bonus.c \
	get_next_line_utils_bonus.c \
	ft_fprintf.c \
	ft_fprint_hex.c \
	ft_free_strs.c \
	ft_atoi_base.c \
	ft_abs.c \
	ft_clean_strs.c \
	ft_strcmp.c

CFLAGS = -Wall -Wextra -Werror

PRINTF_DIR = ./printf
PRINTF_NAME = ./printf/libftprintf.a

RM = rm -rf
AR = ar -rcs
LIB = ranlib

OBJS = ${SRCS:.c=.o}

.PHONY = all clean fclean re 

all: ${PRINTF_NAME} ${NAME}

${PRINTF_NAME}:
	@echo "$(CYAN)🛠  Compiling printf... 🛠$(DEF_COLOR)"
	@make -C ${PRINTF_DIR} --no-print-directory

${NAME}: ${OBJS}
	@echo "$(CYAN)🛠  Compiling libft... 🛠$(DEF_COLOR)"
	@cp ${PRINTF_DIR}/libftprintf.a .
	@mv libftprintf.a ${NAME}
	@${AR} ${NAME} ${OBJS}
	@${LIB} ${NAME}

clean:
	@echo "$(YELLOW)🚽 Deleting object files in libft dir... 🚽$(DEF_COLOR)"
	@${RM} ${OBJS} 
	@make clean -C ${PRINTF_DIR} --no-print-directory

fclean: clean
	@echo "$(RED)🪦 Deleting libft... 🪦$(DEF_COLOR)"
	@${RM} ${NAME}
	@make fclean -C ${PRINTF_DIR} --no-print-directory

re: fclean all

%.o : %.c
	@cc ${CFLAGS} -c $< -o $@
