#!/bin/bash

chown -R mysql:mysql /var/lib/mysql
chmod -R 755 /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

service mariadb start

sleep 3

if ! mysql -e "USE ${MARIADB_DATABASE};" ; then
    echo "Initializing database..."
    mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
    mysql -e "CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';"
    mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';"
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
    mysql -e "FLUSH PRIVILEGES;"
    echo "Database initialization complete."
else
    echo "Database already exists, skipping initialization."
fi

mysqladmin -uroot -p${MARIADB_ROOT_PASSWORD} shutdown

exec mysqld_safe --user=mysql