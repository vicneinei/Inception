# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@student.s19.be>         +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2022/02/08 15:04:09 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version
ARG domain_name

FROM alpine:${version}

EXPOSE 443

RUN \
    apk update &&\
    apk add --no-cache nginx openssl envsubst &&\
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -subj "/C=BE/ST=Belgium/L=Brussels/O=42 Network/OU=s19/CN=${domain_name}" \
    -out "/etc/nginx/${domain_name}.crt" -keyout "/etc/nginx/${domain_name}.key" &&\
    apk del openssl &&\
    rm -f /var/cache/apk/*

COPY ./conf/default.conf ./etc/nginx/http.d

RUN envsubst /etc/nginx/http.d/default.conf

CMD [ "nginx", "-g", "daemon off;" ]