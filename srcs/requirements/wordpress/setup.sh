sleep 10
cd /var/www/html/
if [ ! -f /var/www/html/wp-config.php ]; then

	echo "config not found .. "
	wp core download --locale=en_US --allow-root
	echo "download wordpress"
	wp config create --allow-root \
		--dbname=${MARIADB_DATABASE} \
		--dbuser=${MARIADB_USER} \
		--dbpass=${MARIADB_USER_PASSWORD} \
		--dbhost=mariadb \
		--skip-check
	echo "create config"
	wp core install --allow-root \
		--url=${DOMAIN_NAME} \
		--title="My WordPress Site" \
		--admin_user=${WP_ADMIN} \
		--admin_password=${WP_ADMIN_PASSWORD} \
		--admin_email=${WP_ADMIN_EMAIL}
	echo "create an admin user"
fi
	echo "mam salit"

exec php-fpm8.2 -F