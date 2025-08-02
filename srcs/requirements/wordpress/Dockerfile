FROM debian:12

RUN apt-get update && apt-get upgrade -y && apt-get install wget tar curl  mariadb-client -y

#install php and php-fpm and its dependencies
RUN apt install php-fpm php-common php-mysql \
		php-xml php-intl php-curl php-gd \
		php-imagick php-cli php-dev php-imap \
		php-mbstring php-opcache php-redis \
		php-soap php-zip -y

# install wp-cli
RUN	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \ 
	mv wp-cli.phar /usr/local/bin/wp

# change configuration for memory management

# install wordpress

WORKDIR /tmp
RUN	wget https://wordpress.org/latest.tar.gz
RUN tar xf latest.tar.gz
RUN mkdir /var/www/ && mkdir /var/www/html && mv wordpress /var/www/html/

EXPOSE 9000

ENTRYPOINT [ "php-fpm8.2", "-F" ]

