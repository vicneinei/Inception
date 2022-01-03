# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2022/01/03 10:26:32 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

EXPOSE 9001

RUN \
    apk update &&\
    apk add --no-cache curl php8 php8-session php8-fpm php8-mysqli &&\
    mkdir var/adminer &&\
    rm -f /var/cache/apk/*

COPY ./conf/www.conf /etc/php8/php-fpm.d

COPY ./tools/start.sh /
RUN chmod u+x ./start.sh

CMD [ "./start.sh" ]