# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2022/02/09 14:58:29 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

ENV DOMAIN_NAME="vneirinc.42.fr"

EXPOSE 443

RUN \
    apk update &&\
    apk add --no-cache nginx gettext &&\
    rm -f /var/cache/apk/*

COPY ./conf/default.conf /
COPY ./conf/vneirinc.42.fr.* /etc/nginx/

RUN envsubst < /default.conf > /etc/nginx/http.d/default.conf &&\
    rm -f /default.conf &&\
    apk del gettext

CMD [ "nginx", "-g", "daemon off;" ]