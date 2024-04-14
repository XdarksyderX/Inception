#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setupftp.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarci2 <migarci2@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/14 11:27:09 by migarci2          #+#    #+#              #
#    Updated: 2024/04/14 11:27:10 by migarci2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ ! -f /etc/vsftpd.userlist ]; then
    touch /etc/vsftpd.userlist
fi

if [ -z "$FTP_USER" ] || [ -z "$FTP_PASSWORD" ]; then
    echo "Error: Las variables FTP_USER y FTP_PASSWORD deben estar definidas."
    exit 1
fi

useradd -m -d /var/www/html $FTP_USER
echo $FTP_USER:$FTP_PASSWORD | chpasswd

if ! grep -q "^$FTP_USER\$" /etc/vsftpd.userlist; then
    echo $FTP_USER >> /etc/vsftpd.userlist
fi

chown -R $FTP_USER: /var/www/html/
chmod -R 755 /var/www/html

echo "Iniciando vsftpd en primer plano..."
exec vsftpd /etc/vsftpd.conf