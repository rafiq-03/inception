# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rafiq <rmarzouk@student.1337.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/17 12:08:42 by rafiq             #+#    #+#              #
#    Updated: 2025/05/09 19:41:09 by rafiq            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
END_COLOUR=\033[0m


all:
	@echo "$(COLOUR_BLUE)Building ...$(END_COLOUR)\n"
	@sudo docker-compose -f srcs/docker-compose.yml up
	@echo "\n$(COLOUR_GREEN)Service is running now !!$(END_COLOUR)"

clean:
	sudo docker-compose -f srcs/docker-compose.yml down

fclean:clean
	sudo docker rmi -f srcs_nginx:latest
	sudo docker rmi -f srcs-srcs_nginx:latest

re:fclean all

i:
	sudo docker images