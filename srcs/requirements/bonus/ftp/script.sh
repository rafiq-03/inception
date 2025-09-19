#! /bin/bash

useradd -m ${FTP_USER} && echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

mkdir -p /var/www/html && chown ${FTP_USER}:${FTP_USER} /var/www/html

mkdir -p /var/run/vsftpd/empty

exec vsftpd