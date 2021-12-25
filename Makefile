# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/30 22:00:56 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/25 18:53:57 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DIR		=	./srcs

build:
	docker-compose --project-directory $(DIR) up --build -d

ps:
	docker-compose --project-directory $(DIR) ps

stop:
	docker-compose --project-directory $(DIR) stop

clean: stop
	docker-compose --project-directory $(DIR) rm 

re: clean build

.PHONY:	build ps stop clean