# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/22 20:33:35 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/29 13:17:18 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

ARG version

FROM alpine:${version}

EXPOSE 6379

RUN \
    apk update &&\
    apk add --no-cache redis &&\
    rm -f /var/cache/apk/*

CMD [ "redis-server", "--protected-mode", "no" ]