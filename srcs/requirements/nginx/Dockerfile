# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarci2 <migarci2@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/12 21:20:19 by migarci2          #+#    #+#              #
#    Updated: 2024/04/12 21:35:12 by migarci2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y \
							nginx \
							openssl

WORKDIR /etc/nginx

COPY ./config/nginx.conf /etc/nginx/conf.d

RUN mkdir /etc/nginx/ssl
COPY ./config/ssl/migarci2.crt /etc/nginx/ssl/migarci2.crt
COPY ./config/ssl/migarci2.key /etc/nginx/ssl/migarci2.key

RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]