FROM ubuntu:14.04
MAINTAINER nealhardesty@yahoo.com

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
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends vim curl wget rsync openssh-client \
    && rm -rf /var/cache/oracle-jdk8-installer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -s /bin/bash -d /opt/spark spark

RUN cd /var/tmp \
    && wget --quiet http://d3kbcqa49mib13.cloudfront.net/spark-2.0.0-bin-hadoop2.7.tgz \
    && tar xvfC spark* /opt \
    && rm spark*.tgz \
    && chown -R spark /opt/spark* \
    && ln -svf /opt/spark* /opt/spark 

RUN mkdir /shared && chmod 1777 /shared

ADD ./lib/start-spark-master.sh /start-spark-master.sh
ADD ./lib/start-spark-slave.sh /start-spark-slave.sh
ADD ./lib/start-spark.sh /start-spark.sh

ENV SPARK_WORKER_PORT=7078
ENV SLAVE_MEMORY=1g
ENV SLAVE_CORES=1
ENV SLAVE_WORKDIR=/opt/spark/work

ENV SPARK_HOME=/opt/spark

ENV SPARK_MASTER=spark://spark:7077

# Spark master port
EXPOSE 7077
# Spark slave port
EXPOSE 7078
# Spark master web ui
EXPOSE 8080
# Spark driver web ui
EXPOSE 4040
# Spark master rest api
EXPOSE 6067

CMD /start-spark-all.sh
