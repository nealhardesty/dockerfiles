# Dockerfile
#
#
# Base quantal build

FROM	ubuntu:quantal
MAINTAINER	Neal Hardesty <nealhardesty@yahoo.dot.com>

ADD https://raw2.github.com/nealhardesty/dockerfiles/master/sources.list.quantal /etc/apt/sources.list
RUN bash -c 'echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu quantal main" > /etc/apt/sources.list.d/webupd8team-java-quantal.list'
RUN apt-get update

RUN echo "yes" | apt-get install -y --force-yes oracle-java6-installer


ENV JAVA_HOME /usr/lib/jvm/java-6-oracle

RUN java -version
