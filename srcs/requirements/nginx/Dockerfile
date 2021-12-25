# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/25 12:40:52 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

EXPOSE 443

RUN apk update &&\
    apk add --no-cache nginx openssl 

COPY . .
RUN mv conf/default.conf /etc/nginx/http.d/default.conf &&\
    mv conf/index.html /var/www/index.html &&\
    rm -r conf &&\
    openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=BE/ST=Belgium/L=Brussels/O=42 Network/OU=s19/CN=vneirinc" -out /etc/nginx/vneirinc.42.fr.crt -keyout /etc/nginx/vneirinc.42.fr.key

CMD [ "nginx", "-g", "daemon off;" ]