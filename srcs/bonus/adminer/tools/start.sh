#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/31 12:28:01 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/31 12:28:01 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

curl --retry 5 -SL \
https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1-mysql.php \
-o /var/adminer/index.php;

php-fpm8 -F;