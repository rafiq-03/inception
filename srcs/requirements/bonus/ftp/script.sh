#! /bin/bash

set -e 

useradd -m ftpuser && echo "${FTP_USER}:${FTP_PASSWORD}" | chpasswd

mkdir -p /var/ftp && chown ${FTP_USER}:${FTP_USER} /var/ftp

mkdir -p /var/run/vsftpd/empty

exec vsftpd