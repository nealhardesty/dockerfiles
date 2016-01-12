FROM ubuntu:latest
MAINTAINER nealhardesty@yahoo.com

RUN apt-get update \
    && apt-get install -y wget net-tools git ruby groff less curl \
    && rm -rf /var/lib/apt/lists/*

# I heard you like Docker.  So I put Docker in your Docker so you can Docker while you Docker.
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-1.9.1 -O /usr/local/bin/docker-binary && chmod a+x /usr/local/bin/docker-binary

# lib/docker is actually a wrapper around docker-binary that knows how to talk to the host machine instead of the local container
ADD ./lib/docker /usr/local/bin/docker

# Docker compose ... because...
RUN curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
RUN chmod a+x /usr/local/bin/docker-compose
