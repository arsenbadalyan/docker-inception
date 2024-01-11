FROM debian:bookworm-slim

ARG PORTAINER_VERSION=2.19.4

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y curl

RUN curl -L https://github.com/portainer/portainer/releases/download/${PORTAINER_VERSION}/portainer-${PORTAINER_VERSION}-linux-amd64.tar.gz -o portainer.tar.gz \
    && tar -xvf portainer.tar.gz \
    && mv portainer /usr/local/bin/ \
    && rm -rf portainer.tar.gz \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 9443

CMD ["/usr/local/bin/portainer/portainer"]