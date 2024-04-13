# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarci2 <migarci2@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/12 22:21:59 by migarci2          #+#    #+#              #
#    Updated: 2024/04/13 16:22:10 by migarci2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y mariadb-server
COPY ./config/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY ./config/init.sql /etc/mysql/init.sql

RUN mkdir /run/mysqld

EXPOSE 3306

CMD ["mysqld"]