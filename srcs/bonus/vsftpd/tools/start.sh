#!/bin/sh
# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    start.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: vneirinc <vneirinc@students.s19.be>        +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/12/30 14:38:47 by vneirinc          #+#    #+#              #
#    Updated: 2021/12/30 15:42:25 by vneirinc         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

adduser -D -h $FTP_DIR $FTP_USER $FTP_USER;
echo -e "$FTP_PWD\n$FTP_PWD" | passwd $FTP_USER;
unset FTP_PWD;
chown $FTP_USER:$FTP_USER $FTP_DIR;
chmod a-w $FTP_DIR;

sleep infinity;
#vsftpd /etc/vsftpd/vsftpd.conf;