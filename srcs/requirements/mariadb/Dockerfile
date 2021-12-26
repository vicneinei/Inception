# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/26 20:53:40 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

EXPOSE 3306

RUN \
    apk update &&\
    apk add --no-cache mariadb mariadb-client &&\
    rm -f /var/cache/apk/*

RUN	mkdir -p /var/lib/mysql

COPY ./tools/my.cnf /etc
COPY ./tools/start.sh /

RUN \
    mysql_install_db &&\
    chown -R mysql:mysql /var/lib/mysql &&\
    chmod +x start.sh

CMD [ "./start.sh" ]