FROM debian:bookworm-slim

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y vsftpd && rm -rf /var/lib/apt/lists/*

COPY ./conf/vsftpd.conf /etc/
COPY ./tools/setup_ftp.sh /usr/bin/
RUN chmod +x /usr/bin/setup_ftp.sh

WORKDIR /var/www/

EXPOSE 21

CMD [ "/usr/bin/setup_ftp.sh" ]