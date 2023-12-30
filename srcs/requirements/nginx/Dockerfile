FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y nginx openssl && rm -rf /var/lib/apt/lists/*

COPY ./conf/default.conf /etc/nginx/sites-available/

WORKDIR /usr/bin

COPY ./tools/run_nginx.sh ./
RUN chmod +x run_nginx.sh

EXPOSE 443

CMD [ "/usr/bin/run_nginx.sh" ]