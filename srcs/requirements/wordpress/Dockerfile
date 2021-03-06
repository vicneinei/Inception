# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2022/02/09 14:01:48 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

ARG WP_DL

# Default wordpress php packages https://github.com/yobasystems/alpine-php-wordpress/tree/master/alpine-php-wordpress-amd64/files
ARG RUN_PKGS="php8-fpm php8-json php8-zlib php8-xml php8-xmlwriter \
    php8-simplexml php8-pdo php8-phar php8-openssl \
    php8-pdo_mysql php8-mysqli php8-session \
    php8-gd php8-iconv php8-gmp php8-zip \
    php8-curl php8-opcache php8-ctype \
    php8-intl php8-bcmath php8-dom php8-mbstring php8-xmlreader"

ARG BUILD_PKGS="curl"

EXPOSE 9000

RUN \
    apk update &&\
    apk add --no-cache ${RUN_PKGS} ${BUILD_PKGS} &&\
    ln -sf /usr/bin/php8 /usr/bin/php &&\
    curl -L ${WP_DL} -o /usr/bin/wp &&\
    chmod +x ./usr/bin/wp &&\
    wp cli update &&\
    apk del ${BUILD_PKGS} &&\
    rm -f /var/cache/apk/*

COPY ./conf/wp-config.php /
COPY ./conf/www.conf /etc/php8/php-fpm.d
COPY ./tools/start.sh /

RUN chmod +x start.sh

CMD [ "./start.sh" ]