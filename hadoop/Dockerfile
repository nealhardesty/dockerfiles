# Dockerfile
#
#
# Base quantal build

FROM	ubuntu:quantal
MAINTAINER	Neal Hardesty <nealhardesty@yahoo.dot.com>

ADD https://raw2.github.com/nealhardesty/dockerfiles/master/sources.list.quantal /etc/apt/sources.list
RUN apt-get update
RUN apt-get install -y wget

RUN bash -c 'echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu quantal main" > /etc/apt/sources.list.d/webupd8team-java-quantal.list'

RUN wget -O- http://archive.apache.org/dist/bigtop/bigtop-0.5.0/repos/GPG-KEY-bigtop | sudo apt-key add -
RUN sudo wget -O /etc/apt/sources.list.d/bigtop-0.5.0.list http://archive.apache.org/dist/bigtop/bigtop-0.5.0/repos/`lsb_release --codename --short`/bigtop.list

RUN apt-get update

RUN echo "yes" | apt-get install -y --force-yes oracle-java6-installer

ENV JAVA_HOME /usr/lib/jvm/java-6-oracle

RUN apt-get install -y bigtop-utils
RUN bash -c 'echo "export JAVA_HOME=/usr/lib/jvm/java-6-oracle" >> /etc/profile'
RUN bash -c 'echo "export JAVA_HOME=/usr/lib/jvm/java-6-oracle" >> /etc/default/bigtop-utils'

RUN apt-get install -y hadoop-hdfs-namenode
RUN /etc/init.d/hadoop-hdfs-namenode init

RUN echo '<configuration> <property> <name>fs.defaultFS</name> <value>hdfs://localhost/</value> </property> </configuration>' > /etc/hadoop/conf/core-site.xml

RUN apt-get install -y hadoop-hdfs-datanode

#RUN service hadoop-hdfs-namenode start
#RUN service hadoop-hdfs-datanode start

RUN apt-get install -y hadoop-yarn hadoop-yarn-resourcemanager hadoop-yarn-nodemanager

#sudo -u hdfs hadoop fs -mkdir -p /user/$USER
#sudo -u hdfs hadoop fs -chown $USER:$USER /user/$USER
#sudo -u hdfs hadoop fs -chmod 770 /user/$USER
#
#sudo -u hdfs hadoop fs -mkdir /tmp
#sudo -u hdfs hadoop fs -chmod -R 1777 /tmp
#
#sudo -u hdfs hadoop fs -mkdir -p /var/log/hadoop-yarn
#sudo -u hdfs hadoop fs -chown yarn:mapred /var/log/hadoop-yarn
#
#sudo -u hdfs hadoop fs -mkdir -p /user/history
#sudo -u hdfs hadoop fs -chown mapred:mapred /user/history
#sudo -u hdfs hadoop fs -chmod 770 /user/history
#
#sudo -u hdfs hadoop fs -mkdir -p /tmp/hadoop-yarn/staging
#sudo -u hdfs hadoop fs -chmod -R 1777 /tmp/hadoop-yarn/staging
#
#sudo -u hdfs hadoop fs -mkdir -p /tmp/hadoop-yarn/staging/history/done_intermediate
#sudo -u hdfs hadoop fs -chmod -R 1777 /tmp/hadoop-yarn/staging/history/done_intermediate
#sudo -u hdfs hadoop fs -chown -R mapred:mapred /tmp/hadoop-yarn/staging
#RUN sudo service hadoop-yarn-resourcemanager start
#RUN sudo service hadoop-yarn-nodemanager start
#RUN hadoop fs -lsr /
#hadoop jar /usr/lib/hadoop-mapreduce/hadoop-mapreduce-examples*.jar pi 10 1000
