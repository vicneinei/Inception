# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2022/02/08 18:08:16 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

EXPOSE 3306

RUN \
    apk update &&\
    apk add --no-cache mariadb mariadb-client &&\
    rm -f /var/cache/apk/*

COPY ./conf/my.cnf /etc
COPY ./tools/start.sh /

RUN \
    mkdir -p /var/lib/mysql &&\
    chown -R mysql:mysql var/lib/mysql &&\
    mysql_install_db &&\
    chmod +x ./start.sh

CMD [ "./start.sh" ]