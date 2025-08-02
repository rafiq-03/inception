#!/bin/bash

# echo "here we go again .."
# service mariadb start
echo "check maraidb if it is working"
service mariadb status

mariadbd -u root < init.sql

exec mysqld_safe