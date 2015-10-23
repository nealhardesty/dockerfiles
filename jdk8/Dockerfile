# Dockerfile
#
#
# Base quantal build

FROM	ubuntu:wily
MAINTAINER	Neal Hardesty <nealhardesty@yahoo.dot.com>

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update && apt-get upgrade -y 

RUN echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | /usr/bin/debconf-set-selections
RUN apt-get install -y --force-yes oracle-java8-installer
RUN update-java-alternatives -s java-8-oracle
RUN apt-get install oracle-java8-set-default

RUN java -version
