FROM debian:12

RUN apt-get update && apt-get upgrade -y && apt-get install nginx openssl -y

# generate a ssl_certificate

WORKDIR /etc/nginx/

RUN openssl req \
	-newkey rsa:2048 -nodes -keyout rmarzouk.42.fr.key \
	-x509 -days 365 -out rmarzouk.42.fr.crt\
	-subj "/C=MA/ST=Morocco/L=Tetouan/O=1337student/CN=rmarzouk.42.fr"

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

