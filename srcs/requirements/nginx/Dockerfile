# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/23 10:14:54 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine

EXPOSE 80

RUN apk update
RUN apk add nginx

COPY conf/default.conf /etc/nginx/http.d/
COPY conf/index.html /var/www/

CMD [ "nginx", "-g", "daemon off;" ]