# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rafiq <rmarzouk@student.1337.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/17 12:08:42 by rafiq             #+#    #+#              #
#    Updated: 2025/08/27 11:34:14 by rafiq            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
END_COLOUR=\033[0m


all:
	@echo "$(COLOUR_BLUE)Building ...$(END_COLOUR)\n"
	docker-compose -f srcs/docker-compose.yml up --build -d
	@echo "\n$(COLOUR_GREEN)Service is running now !!$(END_COLOUR)"

clean:
	docker-compose -f srcs/docker-compose.yml down

fclean:clean

re:fclean all

i:
	docker images
down:
	docker compose -f srcs/docker-compose.yml down 