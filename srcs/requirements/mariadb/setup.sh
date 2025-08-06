#!/bin/bash

# setup mariadb here

service mariadb start

mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
mysql -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO '${MARIADB_USER}'@'%';"
mysql -uroot -p${MARIADB_ROOT_PASSWORD} -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"
mysql -e "FLUSH PRIVILEGES;"
mysqladmin -uroot -p${MARIADB_ROOT_PASSWORD} shutdown

# execute mairadb service.
exec "mysqld_safe"