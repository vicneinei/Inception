# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/25 20:37:50 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

EXPOSE 3306

ARG RUN_PKGS="mariadb mariadb-client mariadb-server-utils pwgen"

RUN \
    apk update &&\
    apk add --no-cache $(RUN_PKGS) &&\
    rm -f /var/cache/apk/*

CMD [ "sleep", "infinity" ]