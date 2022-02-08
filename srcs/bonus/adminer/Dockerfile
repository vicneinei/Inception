# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2022/02/08 18:13:41 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

EXPOSE 9000

ARG ADMINER_DL

RUN \
    apk update &&\
    apk add --no-cache curl php8 php8-session php8-fpm php8-mysqli &&\
    mkdir var/adminer &&\
    curl -L $ADMINER_DL -o /var/adminer/index.php &&\
    apk del curl &&\
    rm -f /var/cache/apk/*

COPY ./conf/www.conf /etc/php8/php-fpm.d

CMD [ "php-fpm8", "-F" ]