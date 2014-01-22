# Dockerfile
#
#
# Base quantal build

FROM	ubuntu:quantal
MAINTAINER	Neal Hardesty <nealhardesty@yahoo.dot.com>

RUN bash -c 'echo "deb http://us.archive.ubuntu.com/ubuntu/ quantal main restricted" > /etc/apt/sources.list'
RUN bash -c 'echo "deb-src http://us.archive.ubuntu.com/ubuntu/ quantal main restricted" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb http://us.archive.ubuntu.com/ubuntu/ quantal-updates main restricted" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb-src http://us.archive.ubuntu.com/ubuntu/ quantal-updates main restricted" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb http://us.archive.ubuntu.com/ubuntu/ quantal universe" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb-src http://us.archive.ubuntu.com/ubuntu/ quantal universe" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb http://us.archive.ubuntu.com/ubuntu/ quantal-updates universe" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb-src http://us.archive.ubuntu.com/ubuntu/ quantal-updates universe" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb http://us.archive.ubuntu.com/ubuntu/ quantal multiverse" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb-src http://us.archive.ubuntu.com/ubuntu/ quantal multiverse" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb http://us.archive.ubuntu.com/ubuntu/ quantal-updates multiverse" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb-src http://us.archive.ubuntu.com/ubuntu/ quantal-updates multiverse" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb http://us.archive.ubuntu.com/ubuntu/ quantal-backports main restricted universe multiverse" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb-src http://us.archive.ubuntu.com/ubuntu/ quantal-backports main restricted universe multiverse" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb http://security.ubuntu.com/ubuntu quantal-security main restricted" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb-src http://security.ubuntu.com/ubuntu quantal-security main restricted" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb http://security.ubuntu.com/ubuntu quantal-security universe" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb-src http://security.ubuntu.com/ubuntu quantal-security universe" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb http://security.ubuntu.com/ubuntu quantal-security multiverse" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb-src http://security.ubuntu.com/ubuntu quantal-security multiverse" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb http://extras.ubuntu.com/ubuntu quantal main" >> /etc/apt/sources.list'
RUN bash -c 'echo "deb-src http://extras.ubuntu.com/ubuntu quantal main" >> /etc/apt/sources.list'

RUN apt-get update
