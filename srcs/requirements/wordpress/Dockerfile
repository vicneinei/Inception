# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2022/01/04 11:21:05 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

EXPOSE 9000

# Default wordpress php packages https://github.com/yobasystems/alpine-php-wordpress/tree/master/alpine-php-wordpress-amd64/files
ARG RUN_PKGS="php8-fpm php8-json php8-zlib php8-xml php8-xmlwriter \
    php8-simplexml php8-pdo php8-phar php8-openssl \
    php8-pdo_mysql php8-mysqli php8-session \
    php8-gd php8-iconv php8-gmp php8-zip \
    php8-curl php8-opcache php8-ctype \
    php8-intl php8-bcmath php8-dom php8-mbstring php8-xmlreader"

RUN \
    apk update &&\
    apk add --no-cache ${RUN_PKGS} curl &&\
    ln -sf /usr/bin/php8 /usr/bin/php &&\
    curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		--output /usr/bin/wp &&\
    chmod +x ./usr/bin/wp &&\
    wp cli update &&\
    apk del curl &&\
    rm -f /var/cache/apk/*

COPY ./tools/start.sh /
COPY ./conf/wp-config.php /
COPY ./conf/www.conf /etc/php8/php-fpm.d

RUN chmod u+x ./start.sh

CMD [ "./start.sh" ]
#CMD [ "sleep", "infinity" ]