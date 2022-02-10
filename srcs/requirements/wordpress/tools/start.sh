#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/31 11:52:19 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/31 11:52:19 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [[ ! -f /var/www/wordpress/wp-config.php ]]; then
  mv /wp-config.php $WP_DIR;
  wp core download --version=5.9 --path=$WP_DIR;
  wp core install --path=$WP_DIR --url=$URL --title=$TITLE --admin_user=$WP_USER --admin_password=$WP_PWD --admin_email=$WP_MAIL
  wp plugin install redis-cache --activate --path=$WP_DIR;
  wp plugin update --all --path=$WP_DIR;
  wp redis enable --path=$WP_DIR;
fi
php-fpm8 -F;