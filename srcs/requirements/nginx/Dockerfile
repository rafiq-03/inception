FROM debian:12

RUN apt-get update && apt-get upgrade -y && apt-get install nginx -y

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443
# run nginx 
# I should know the -g flag aand deamon off also 
CMD ["nginx", "-g", "daemon off;"]

