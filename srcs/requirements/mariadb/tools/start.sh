#/bin/sh
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

echo "DROP DATABASE test;" | mysql -u root &&\
#echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('root');" | mysql -u root &&\
echo "CREATE DATABASE wordpress;" | mysql -u root &&\
echo "CREATE USER 'coucou'@'%' IDENTIFIED BY 'test';" | mysql -u root &&\
echo "GRANT ALL PRIVILEGES ON wordpress.* TO coucou@'%' ;" | mysql -u root &&\
echo "FLUSH PRIVILEGES;"