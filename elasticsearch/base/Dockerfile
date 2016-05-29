FROM ubuntu:xenial
MAINTAINER nealhardesty@yahoo.com

RUN apt-get update \                                                                                                                                            
  && apt-get install -y software-properties-common vim curl build-essential wget sudo \
  && add-apt-repository -y ppa:webupd8team/java \
  && apt-get update \
  && echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections \
  && echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y oracle-java8-installer \
  && rm -rf /var/lib/apt/lists/*

RUN wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add - \
  && echo "deb http://packages.elastic.co/elasticsearch/2.x/debian stable main" > /etc/apt/sources.list.d/elasticsearch-2.x.list \
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y elasticsearch \
  && rm -rf /var/lib/apt/lists/*

# Kibana
#RUN cd /var/tmp \
#  && wget -q https://download.elastic.co/kibana/kibana/kibana-4.5.1-linux-x64.tar.gz \
#  && tar xzCf /opt kibana*.tar.gz \
#  && ln -sv /opt/kibana* /opt/kibana \
#  && rm kibana*.tar.gz
#EXPOSE 5601

EXPOSE 9200
ENV ES_HEAP_SIZE 1g
CMD service elasticsearch start && sleep 1000d
