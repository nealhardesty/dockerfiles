FROM ubuntu:latest
MAINTAINER nealhardesty@yahoo.com

RUN apt-get update && apt-get install -y wget
RUN wget https://get.docker.com/builds/Linux/x86_64/docker-1.9.1 -O /usr/local/bin/docker-binary && chmod a+x /usr/local/bin/docker-binary
ADD ./lib/docker /usr/local/bin/docker
