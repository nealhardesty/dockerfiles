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
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes oracle-java8-installer oracle-java8-set-default \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes vim curl wget \
    && rm -rf /var/cache/oracle-jdk8-installer \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

ENV SCALA_VERSION 2.11.7
ENV SCALA_TARBALL http://downloads.typesafe.com/scala/2.11.7/scala-$SCALA_VERSION.tgz
ENV SCALA_HOME /usr/local/

ENV SBT_VERSION 0.13.8
ENV SBT_LAUNCH https://repo.typesafe.com/typesafe/ivy-releases/org.scala-sbt/sbt-launch/$SBT_VERSION/sbt-launch.jar

RUN curl -s $SCALA_TARBALL -o /var/tmp/scala.tgz \
    && tar --strip-components 1 -xvf /var/tmp/scala.tgz -C $SCALA_HOME \
    && rm /var/tmp/scala.tgz

RUN curl -vLs $SBT_LAUNCH -o /usr/local/bin/sbt-launch.jar

ADD ./lib/sbt /usr/local/bin/sbt

# Will precache all the necessary jars
RUN sbt

CMD ["scala"]
