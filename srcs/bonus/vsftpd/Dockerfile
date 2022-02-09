# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2022/02/09 10:37:22 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

ARG domain_name

EXPOSE 20 21 990 40000-40100

RUN \
    apk update &&\
    apk add --no-cache vsftpd openssl &&\
    openssl req -new -newkey rsa:2048 -x509 -sha256 -days 365 -nodes \
    -subj "/C=BE/ST=Brussels/L=Brussels/O=42/OU=19/CN=${domain_name}" \
    -out "/etc/ssl/private/${domain_name}.pem" -keyout \
    "/etc/ssl/private/${domain_name}.pem" &&\
    rm -f /var/cache/apk/*

COPY ./conf/vsftpd.conf ./etc/vsftpd/
COPY ./tools/start.sh ./start.sh
RUN chmod u+x ./start.sh

CMD [ "./start.sh" ]