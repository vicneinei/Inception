# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/30 22:00:56 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/26 20:30:07 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DIR		=	./srcs

build:
	docker-compose --project-directory $(DIR) up --build -d

down:
	docker-compose --project-directory $(DIR) down

ps:
	docker-compose --project-directory $(DIR) ps

stop:
	docker-compose --project-directory $(DIR) stop

clean: stop
	docker-compose --project-directory $(DIR) rm 

fclean: clean
	docker volume rm wordpress

re: clean build

.PHONY:	build ps stop clean