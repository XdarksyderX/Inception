# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarci2 <migarci2@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/14 11:31:28 by migarci2          #+#    #+#              #
#    Updated: 2024/04/14 11:42:36 by migarci2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y wget php php-mysql

RUN mkdir -p /var/www/html

RUN wget "http://www.adminer.org/latest.php" -O /var/www/html/adminer.php  && \
	chown -R www-data:www-data /var/www/html/adminer.php && \
	chmod 755 /var/www/html/adminer.php && \
	rm /var/www/html/index.html && \
	mv /var/www/html/adminer.php /var/www/html/index.php

WORKDIR /var/www/html

USER www-data

EXPOSE 8080

CMD ["php", "-S", "0.0.0.0:8080"]
