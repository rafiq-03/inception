FROM debian:12

RUN apt-get update && \
    apt-get install -y mariadb-server && \
    apt-get clean

RUN	sed -i 's#bind-address\s*= 127.0.0.1#bind-address = 0.0.0.0#' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./setup.sh ./setup.sh

EXPOSE 3306

ENTRYPOINT ["bash", "setup.sh"]