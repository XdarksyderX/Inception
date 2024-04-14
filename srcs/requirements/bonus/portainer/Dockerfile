# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarci2 <migarci2@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/14 15:29:23 by migarci2          #+#    #+#              #
#    Updated: 2024/04/14 15:42:38 by migarci2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

RUN apt-get update && apt-get install -y curl && \
	rm -rf /var/lib/apt/lists/*

	RUN curl -L https://github.com/portainer/portainer/releases/download/2.20.1/portainer-2.20.1-linux-amd64.tar.gz -o portainer.tar.gz \
    && tar xzf portainer.tar.gz -C /opt \
    && rm portainer.tar.gz

VOLUME ["/data"]

EXPOSE 9000

CMD ["/opt/portainer/portainer", "--data", "/data", "--bind", ":9000", "--no-analytics"]
