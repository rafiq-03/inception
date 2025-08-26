#!/bin/bash

# setup mariadb here

# Ensure proper ownership and permissions for MariaDB data directory
chown -R mysql:mysql /var/lib/mysql
chmod -R 755 /var/lib/mysql

# Initialize MariaDB data directory if it doesn't exist or is empty
if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Initializing MariaDB data directory..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql
fi

# Start MariaDB service
service mariadb start

# Wait for MariaDB to be ready
sleep 3

# Check if our custom database exists (not just the directory)
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

# Stop the service before starting mysqld_safe
mysqladmin -uroot -p${MARIADB_ROOT_PASSWORD} shutdown

# Start MariaDB daemon
exec mysqld_safe --user=mysql