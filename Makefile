# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rafiq <rmarzouk@student.1337.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/17 12:08:42 by rafiq             #+#    #+#              #
#    Updated: 2025/09/19 11:39:11 by rafiq            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

COLOUR_GREEN=\033[0;32m
COLOUR_RED=\033[0;31m
COLOUR_BLUE=\033[0;34m
END_COLOUR=\033[0m

CONF_FILE=srcs/docker-compose.yml

	
up:
	mkdir -p /home/rafiq/data/mariadb
	mkdir -p /home/rafiq/data/wp
	@docker-compose -f srcs/docker-compose.yml up --build -d

down:
	@docker-compose -f $(CONF_FILE) down -v

start:
	@docker-compose -f $(CONF_FILE) start

stop:
	@docker-compose -f $(CONF_FILE) stop

clean:down
	rm -rf ~/data

re:clean up

ps:
	@docker-compose -f $(CONF_FILE) ps
