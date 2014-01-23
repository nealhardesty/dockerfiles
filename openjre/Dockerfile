# Dockerfile
#
#
# Base quantal build

FROM	ubuntu:quantal
MAINTAINER	Neal Hardesty <nealhardesty@yahoo.dot.com>

ADD https://raw2.github.com/nealhardesty/dockerfiles/master/sources.list.quantal /etc/apt/sources.list
RUN apt-get update

RUN apt-get install -y openjdk-7-jre-headless 

ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/
