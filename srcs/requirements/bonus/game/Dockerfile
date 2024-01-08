FROM debian:bookworm-slim

RUN mkdir -p /var/www/nodejs
RUN mkdir -p /var/www/html

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs && rm -rf /var/lib/apt/lists/*

COPY ./server/ /var/www/nodejs
ADD ./public/ /var/www/html

COPY ./tools/setup_node.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/setup_node.sh

EXPOSE 3000

CMD [ "/usr/local/bin/setup_node.sh" ]