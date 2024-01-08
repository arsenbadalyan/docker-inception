FROM debian:bookworm-slim

RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y redis && rm -rf /var/lib/apt/lists/*

COPY ./tools/setup_redis.sh /usr/bin/
RUN chmod +x /usr/bin/setup_redis.sh

EXPOSE 6379

CMD [ "/usr/bin/setup_redis.sh" ]