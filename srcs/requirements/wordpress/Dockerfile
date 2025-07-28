FROM alpine

# I should know why --no-cach flag an 

RUN apk update && apk add --no-cache nginx
 
# copy config file of nginx from my host to image

# COPY ./conf/nginx.conf /etc/nginx/nginx.conf

# expose port 443 for documentation

EXPOSE 9000
# run nginx 
# I should know the -g flag aand deamon off also 
CMD ["nginx", "-g", "daemon off;"]

