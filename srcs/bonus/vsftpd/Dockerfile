# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/29 11:08:40 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

EXPOSE 20 21 990

RUN \
    apk update &&\
    apk add --no-cache vsftpd openssl &&\
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
     -subj "/C=BE/ST=Belgium/L=Brussels/O=42 Network/OU=s19/CN=vneirinc.42.fr" \
    -out /etc/vsftpd/vneirinc.42.fr.crt -keyout /etc/vsftpd/vneirinc.42.fr.key &&\
    mkdir -p /var/www/wordpress &&\
    apk del openssl &&\
    rm -f /var/cache/apk/*
    #adduser --gecos --disable-password ft_wp &&\
    #usermod -d /var/www ft_wp &&\
    #chown ft_wp:ft_wp /var/www/wordpress &&\

COPY ./conf/vsftpd.conf ./etc/vsftpd/

#CMD [ "vsftpd", "/etc/vsftpd/vsftpd.conf" ]
CMD [ "sleep", "infinity" ]