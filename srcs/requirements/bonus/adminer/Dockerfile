FROM debian:12

RUN apt-get update && \
    apt-get install -y nginx php-fpm php-mysqli adminer && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

RUN printf "<?php\nrequire '/usr/share/adminer/adminer.php';\n" > /usr/share/adminer/index.php

RUN sed -ri 's|^;?listen.owner =.*|listen.owner = www-data|' /etc/php/8.2/fpm/pool.d/www.conf && \
    sed -ri 's|^;?listen.group =.*|listen.group = www-data|' /etc/php/8.2/fpm/pool.d/www.conf && \
    sed -ri 's|^;?listen.mode =.*|listen.mode = 0660|' /etc/php/8.2/fpm/pool.d/www.conf

COPY nginx.conf /etc/nginx/nginx.conf
COPY script.sh /script.sh
RUN chmod +x /script.sh

EXPOSE 9090
ENTRYPOINT ["bash", "/script.sh"]