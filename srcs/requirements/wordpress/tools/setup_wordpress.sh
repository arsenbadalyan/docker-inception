#!/bin/bash

mkdir -p /var/www/html
cd /var/www/html

if [ -f ./wp-config.php ]; then
	echo "Wordpress download already done."
else

	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	sed -i "s/username_here/$MYSQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" wp-config-sample.php
	sed -i "s/database_name_here/$MYSQL_DB/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

	# redis configs/plugin setup
	wp config set WP_REDIS_HOST $REDIS_HOSTNAME --allow-root
    wp config set WP_REDIS_PORT $REDIS_PORT --raw --allow-root
    wp config set WP_CACHE_KEY_SALT $DOMAIN_NAME --allow-root
    wp config set WP_REDIS_PASSWORD $REDIS_PASSWORD --allow-root
    wp config set WP_REDIS_CLIENT phpredis --allow-root

fi

exec $@