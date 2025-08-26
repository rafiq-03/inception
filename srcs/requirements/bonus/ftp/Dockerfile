FROM debian:12

RUN apt-get update &&\
    apt-get install -y vsftpd ftp &&\
    rm -rf /var/lib/apt/lists/*

COPY script.sh /script.sh

COPY vsftpd.conf /etc/vsftpd.conf

EXPOSE 21 21000-21010

ENTRYPOINT ["bash", "/script.sh"]