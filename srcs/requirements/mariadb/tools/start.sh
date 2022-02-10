#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/26 20:22:26 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/26 20:22:26 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [[ ! -f /var/lib/mysql/.init ]]; then
  mysqld_safe &
  if mysqladmin -u root --wait=60 ping; then
    mysql -u root -e "DROP DATABASE test;
                      CREATE DATABASE $MYSQL_DATABASE;
                      ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';
                      CREATE USER '$MYSQL_USER'@'wordpress.my_net' IDENTIFIED BY '$MYSQL_PWD';
                      GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO $MYSQL_USER@'wordpress.my_net';
                      FLUSH PRIVILEGES;"
  fi
  mysqladmin shutdown
  touch /var/lib/mysql/.init
fi

unset MYSQL_PWD;
unset MYSQL_ROOT_PWD;

mysqld_safe