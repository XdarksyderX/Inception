# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarci2 <migarci2@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/12 21:41:37 by migarci2          #+#    #+#              #
#    Updated: 2024/04/13 14:41:10 by migarci2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:latest

RUN apt-get update && \
    apt-get install -y wget curl bash php php-fpm php-cgi php-mysql php-pdo php-gd php-cli php-mbstring sendmail iproute2 && \
    rm -rf /var/lib/apt/lists/* && \
    mkdir -p /var/www/html /run/php

RUN    sed -i 's/listen = \/run\/php\/php8.2-fpm.sock/listen = 9000/g' /etc/php/8.2/fpm/pool.d/www.conf

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/config_wp.sh /usr/bin/config_wp.sh

RUN chmod +x /usr/bin/config_wp.sh

RUN touch /var/log/php8.2-fpm.log && \
    chown www-data:www-data /var/log/php8.2-fpm.log

VOLUME /var/www/html

RUN mkdir -p /var/www/html /run/php /var/log/php-fpm && \
    chown -R www-data:www-data /var/www /run/php /var/log/php-fpm

WORKDIR /var/www/html/

EXPOSE 9000

ENTRYPOINT ["/usr/bin/config_wp.sh"]
