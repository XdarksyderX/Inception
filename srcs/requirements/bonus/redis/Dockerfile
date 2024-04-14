# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarci2 <migarci2@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/13 23:32:24 by migarci2          #+#    #+#              #
#    Updated: 2024/04/14 00:12:28 by migarci2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:latest

RUN apt-get update && apt-get install -y redis-server

RUN mkdir -p /etc/redis

COPY ./config/redis.conf /etc/redis/redis.conf

EXPOSE 6379

CMD ["redis-server", "/etc/redis/redis.conf", "--daemonize no"]
