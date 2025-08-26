#! /bin/bash
php-fpm8.2 -F &
exec nginx -g "daemon off;"