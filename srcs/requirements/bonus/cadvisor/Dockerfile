FROM debian:12

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.53.0/cadvisor-v0.53.0-linux-amd64 \
    && chmod +x cadvisor-v0.53.0-linux-amd64

CMD ["./cadvisor-v0.53.0-linux-amd64"]