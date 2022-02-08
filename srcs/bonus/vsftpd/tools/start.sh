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

adduser -D -h var/www/ ftp_wp ftp_wp;
echo -e "ftp_wp\nftp_wp" | passwd ftp_wp;
unset FTP_PWD;
chown ftp_wp:ftp_wp var/www/;
chmod a-w var/www/;

sleep infinity;
#vsftpd /etc/vsftpd/vsftpd.conf;