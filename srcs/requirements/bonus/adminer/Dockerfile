FROM debian:12

RUN apt-get update && \
    apt-get install -y nginx php-fpm php-mysqli adminer && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN cp /usr/share/adminer/adminer.php /var/www/html/index.php

EXPOSE 9090

ENTRYPOINT ["php", "-S", "0.0.0.0:9090", "-t", "/var/www/html"]