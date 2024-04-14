# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarci2 <migarci2@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/14 12:30:29 by migarci2          #+#    #+#              #
#    Updated: 2024/04/14 13:02:46 by migarci2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y lighttpd

RUN mkdir -p /var/www/html

COPY ./config/index.html /var/www/html/index.html

COPY ./config/assets.tar /var/www/html/assets.tar

RUN tar -xvf /var/www/html/assets.tar -C /var/www/html/ && \
	rm /var/www/html/assets.tar

RUN chown -R www-data:www-data /var/www/html && \
	chmod -R 755 /var/www/html && \
	rm /var/www/html/index.lighttpd.html

RUN mkdir -p /var/run/lighttpd && \
	chown www-data:www-data /var/run/lighttpd && \
	chmod 755 /var/run/lighttpd

COPY ./config/lighttpd.conf /etc/lighttpd/lighttpd.conf

WORKDIR /var/www/html

EXPOSE 80

USER www-data

CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]