FROM ubuntu:16.04
MAINTAINER nealhardesty@yahoo.com

RUN useradd -s /bin/bash -m -d /home/neal -U -G sudo neal

  
# Install Oracle JDK 8 : http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html
RUN \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
    && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \
    && apt-get update -y -q \
    && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes tmux git build-essential ruby-dev python-dev python-pip wget curl netcat unzip vim htop sysstat sudo \
    && rm -rf /var/cache/oracle-jdk8-installer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# No passwords for sudo, yay!
ADD ./lib/sudoers /etc/sudoers

USER neal
WORKDIR /home/neal

# Dots and stuff
RUN mkdir bin dev neal && cd dev && git clone https://github.com/nealhardesty/dots.git && cd dots && ./setup.sh

