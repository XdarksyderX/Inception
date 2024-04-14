# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarci2 <migarci2@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/14 00:17:26 by migarci2          #+#    #+#              #
#    Updated: 2024/04/14 01:03:33 by migarci2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y vsftpd && \
	rm -rf /var/lib/apt/lists/*

COPY ./config/vsftpd.conf /etc/vsftpd.conf

COPY ./tools/setupftp.sh /usr/bin/setupftp.sh

RUN mkdir -p /var/run/vsftpd/empty && \
chmod 755 /var/run/vsftpd/empty

RUN chmod +x /usr/bin/setupftp.sh

EXPOSE 21

ENTRYPOINT [ "/usr/bin/setupftp.sh" ]