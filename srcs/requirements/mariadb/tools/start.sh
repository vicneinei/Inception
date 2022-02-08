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
    mysql -u root -h localhost -e "DROP DATABASE test"
    mysql -u root -h localhost -e "CREATE DATABASE '$MYSQL_DATABASE'"
    mysql -u root -h localhost -e "ALTER USER 'root'@'*' IDENTIFIED BY '$MYSQL_ROOT_PWD'"
    mysql -u root -h localhost -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PWD'"
    mysql -u root -h localhost -e "GRANT ALL PRIVILEGES ON '$MYSQL_DATABASE'.* TO '$MYSQL_USER'@'%'"
    mysql -u root -h localhost -e "FLUSH PRIVILEGES"
  fi
  mysqladmin shutdown
  touch /var/lib/mysql/.init
fi

unset MYSQL_PWD;
unset MYSQL_ROOT_PWD;

mysqld_safe