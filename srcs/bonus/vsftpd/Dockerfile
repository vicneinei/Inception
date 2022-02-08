# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2022/01/04 09:26:25 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:3.14.3

EXPOSE 20 21 990 40000-40100

RUN \
    apk update &&\
    apk add --no-cache vsftpd openssl &&\
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=19/CN=vneirinc.42.fr" \
    -out /etc/ssl/private/vneirinc.42.fr.crt -keyout /etc/ssl/private/vneirinc.42.fr.key &&\
    rm -f /var/cache/apk/*

COPY ./conf/vsftpd.conf ./etc/vsftpd/
COPY ./tools/start.sh ./start.sh
RUN chmod u+x ./start.sh

CMD [ "./start.sh" ]