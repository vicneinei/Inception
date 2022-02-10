# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/10/30 22:00:56 by vneirinc          #+#    #+#              #
#    Updated: 2022/02/09 14:57:54 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

DIR		=	./srcs

build:
	docker-compose --project-directory $(DIR) up --build -d

cert:
	openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=BE/ST=Belgium/L=Brussels/O=42 Network/OU=s19/CN=vneirinc.42.fr" -out "./srcs/requirements/nginx/conf/vneirinc.42.fr.crt" -keyout "./srcs/requirements/nginx/conf/vneirinc.42.fr.key"

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