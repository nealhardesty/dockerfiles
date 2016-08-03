#!/bin/bash

/usr/bin/zookeeper-server-start -daemon /etc/kafka/zookeeper.properties
(sleep 10 && /usr/bin/kafka-rest-start /etc/kafka-rest/kafka-rest.properties) &
(sleep 10 && /usr/bin/schema-registry-start /etc/schema-registry/schema-registry.properties) &
exec /usr/bin/kafka-server-start /etc/kafka/server.properties
