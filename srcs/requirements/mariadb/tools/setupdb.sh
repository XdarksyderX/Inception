#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setupdb.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarci2 <migarci2@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/14 11:26:32 by migarci2          #+#    #+#              #
#    Updated: 2024/04/14 11:26:33 by migarci2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

sed -i "s/:DB_NAME/$MYSQL_DATABASE/g" /etc/mysql/init.sql
sed -i "s/:USER/$MYSQL_USER/g" /etc/mysql/init.sql
sed -i "s/:UPASS/$MYSQL_PASSWORD/g" /etc/mysql/init.sql
sed -i "s/:ADMIN/$WORDPRESS_ADMIN/g" /etc/mysql/init.sql
sed -i "s/:APASS/$WORDPRESS_ADMIN_PASSWORD/g" /etc/mysql/init.sql

exec mysqld --console