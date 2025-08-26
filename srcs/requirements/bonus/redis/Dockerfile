FROM debian:12

RUN apt-get update && \
    apt-get install -y redis-server && \
    apt-get clean

ENTRYPOINT [ "redis-server" ]