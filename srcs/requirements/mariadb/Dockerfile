FROM debian:buster

RUN	apt update -y && apt upgrade -y
RUN apt install -y mariadb-server mariadb-client && rm -rf /var/lib/apt/lists/*

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/db_start.sh /usr/bin/
RUN chmod +x /usr/bin/db_start.sh

EXPOSE 3306

CMD ["/usr/bin/db_start.sh"]