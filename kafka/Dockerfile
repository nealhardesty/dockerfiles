FROM	ubuntu:16.04
MAINTAINER	Neal Hardesty <nealhardesty@yahoo.dot.com>

# Install Oracle JDK 8
# http://www.webupd8.org/2014/03/how-to-install-oracle-java-8-in-debian.html
RUN \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list \
    && echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list \
    && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886 \
    && apt-get update -q \
    && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
    && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends oracle-java8-installer oracle-java8-set-default \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends vim curl wget \
    && rm -rf /var/cache/oracle-jdk8-installer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN curl -o /var/tmp/kafka.tgz http://mirrors.ocf.berkeley.edu/apache/kafka/0.10.0.0/kafka_2.11-0.10.0.0.tgz \
    #&& file /var/tmp/kafka.tgz
    && tar xzvCf /opt/ /var/tmp/kafka.tgz \
    && ln -sfv /opt/kafka* /opt/kafka \
    && rm /var/tmp/kafka.tgz

ADD ./lib/start_kafka.sh /start_kafka.sh

# Kafka Broker
EXPOSE 9092
# Zookeeper
EXPOSE 2181

CMD /start_kafka.sh
