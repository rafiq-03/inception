FROM debian:12


RUN apt-get update && \
	apt-get upgrade -y && \
	apt-get install nginx -y

WORKDIR /var/www/html	

COPY src/index.html index.html
COPY src/styles.css styles.css

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

