# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/30 19:26:36 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

EXPOSE 20 21 990 40000-40100

RUN \
    apk update &&\
    apk add --no-cache vsftpd openssl &&\
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
     -subj "/C=BE/ST=Belgium/L=Brussels/O=42 Network/OU=s19/CN=vneirinc.42.fr" \
    -out /etc/vsftpd/vneirinc.42.fr.crt -keyout /etc/vsftpd/vneirinc.42.fr.key &&\
    apk del openssl &&\
    rm -f /var/cache/apk/*

COPY ./conf/vsftpd.conf ./etc/vsftpd/
COPY ./tools/start.sh ./start.sh
RUN chmod u+x ./start.sh

CMD [ "./start.sh" ]