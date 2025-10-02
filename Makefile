# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rafiq <rmarzouk@student.1337.com>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/04/17 12:08:42 by rafiq             #+#    #+#              #
#    Updated: 2025/10/02 18:46:44 by rafiq            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

CONF_FILE=srcs/docker-compose.yml
	
up:
	mkdir -p /home/rafiq/data/mariadb
	mkdir -p /home/rafiq/data/wp
	@docker-compose -f srcs/docker-compose.yml up --build -d $(SERVICE)

down:
	@docker-compose -f $(CONF_FILE) down -v

start:
	@docker-compose -f $(CONF_FILE) start $(SERVICE)

stop:
	@docker-compose -f $(CONF_FILE) stop $(SERVICE)

clean:down
	rm -rf /home/rafiq/data/

re:clean up

ps:
	@docker-compose -f $(CONF_FILE) ps
