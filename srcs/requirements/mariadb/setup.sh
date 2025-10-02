
if [ ! -d "/var/lib/mysql/${MARIADB_DATABASE}" ]; then
    echo "Creating ${MARIADB_DATABASE}"
    cat << EOF > /init.sql
USE mysql;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';
CREATE DATABASE IF NOT EXISTS \`${MARIADB_DATABASE}\`;
CREATE USER IF NOT EXISTS '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_USER_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${MARIADB_DATABASE}\`.* TO '${MARIADB_USER}'@'%';
FLUSH PRIVILEGES;
EOF
    if mariadbd --user=mysql --bootstrap < /init.sql; then
        echo "Database and user created successfully."
    else
        echo "Error: Failed to initialize database." >&2
        exit 1
    fi
    rm -f /init.sql
else
    echo "'${MARIADB_DATABASE}' already exists,"
fi

exec mysqld_safe --user=mysql