#!/bin/bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    config_wp.sh                                       :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: migarci2 <migarci2@student.42malaga.com    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/14 11:26:43 by migarci2          #+#    #+#              #
#    Updated: 2024/04/14 11:26:44 by migarci2         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

if [ ! -f wp-config.php ]; then
    wp core download --path=/var/www/html --allow-root
    wp config create --dbname="$MYSQL_DATABASE" --dbhost="$MYSQL_HOSTNAME" \
                    --dbuser="$MYSQL_USER" --dbpass="$MYSQL_PASSWORD" --allow-root
    wp core install --url="$DOMAIN_NAME" --title="Inception" \
                    --admin_user="$WORDPRESS_ADMIN" --admin_password="$WORDPRESS_ADMIN_PASSWORD" \
                    --admin_email="$WORDPRESS_ADMIN_EMAIL" --allow-root

    wp plugin install redis-cache --activate --path=/var/www/html --allow-root
    wp config set WP_REDIS_HOST 'redis' --type=constant --path=/var/www/html --allow-root
    wp config set WP_REDIS_PORT '6379' --type=constant --path=/var/www/html --allow-root
    wp redis enable --path=/var/www/html --allow-root

else
    echo "WordPress is already installed."
fi

echo "Starting PHP-FPM..."

exec php-fpm8.2 -F
