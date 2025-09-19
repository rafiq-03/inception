FROM debian:12

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget

RUN wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor && chmod +x cadvisor

CMD ["./cadvisor"]