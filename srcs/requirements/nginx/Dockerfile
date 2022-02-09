# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2022/02/09 11:16:20 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

ARG domain_name
ENV DOMAIN_NAME="vneirinc.42.fr"

EXPOSE 443

RUN \
    apk update &&\
    apk add --no-cache nginx openssl gettext &&\
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -subj "/C=BE/ST=Belgium/L=Brussels/O=42 Network/OU=s19/CN=${domain_name}" \
    -out "/etc/nginx/${domain_name}.crt" -keyout "/etc/nginx/${domain_name}.key" &&\
    apk del openssl &&\
    rm -f /var/cache/apk/*

COPY ./conf/default.conf /

RUN envsubst < /default.conf > /etc/nginx/http.d/default.conf &&\
	rm -f /default.conf

CMD [ "nginx", "-g", "daemon off;" ]