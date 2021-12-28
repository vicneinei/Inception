# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/27 14:39:22 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

EXPOSE 443

RUN \
    apk update &&\
    apk add --no-cache nginx openssl &&\
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
     -subj "/C=BE/ST=Belgium/L=Brussels/O=42 Network/OU=s19/CN=vneirinc.42.fr" \
    -out /etc/nginx/vneirinc.42.fr.crt -keyout /etc/nginx/vneirinc.42.fr.key &&\
    apk del openssl &&\
    rm -f /var/cache/apk/*

COPY ./conf/default.conf ./etc/nginx/http.d

CMD [ "nginx", "-g", "daemon off;" ]