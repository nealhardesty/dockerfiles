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
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends oracle-java8-installer oracle-java8-set-default \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends vim curl wget \
    && rm -rf /var/cache/oracle-jdk8-installer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

#RUN curl -o /var/tmp/kafka.tgz http://mirrors.ocf.berkeley.edu/apache/kafka/0.10.0.0/kafka_2.11-0.10.0.0.tgz \
#    #&& file /var/tmp/kafka.tgz
#    && tar xzvCf /opt/ /var/tmp/kafka.tgz \
#    && ln -sfv /opt/kafka* /opt/kafka \
#    && rm /var/tmp/kafka.tgz

# Confluent Kafka Platform
RUN wget -qO - http://packages.confluent.io/deb/3.1/archive.key | apt-key add - \
    && echo "deb http://packages.confluent.io/deb/3.1 stable main" |tee -a /etc/apt/sources.list.d/confluent.list \
    && apt-get update -y \
    && apt-get install -y confluent-platform-2.11 \
    && apt-get clean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*

# This assumes we are running as a hostname of 'kafka'
RUN echo "listeners=PLAINTEXT://kafka:9092" >> /etc/kafka/server.properties \
    && echo "log.cleaner.enable=true" >> /etc/kafka/server.properties


ADD ./lib/start_kafka.sh /start_kafka.sh
ADD ./lib/topic-ls /usr/local/bin/topic-ls
ADD ./lib/topic-count /usr/local/bin/topic-count

# Zookeeper
EXPOSE 2181
# Kafka Broker
EXPOSE 9092
# Schema Registry
EXPOSE 8081

CMD /start_kafka.sh
