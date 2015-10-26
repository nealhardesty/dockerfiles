#!/bin/bash -x


docker run -d --name=cassandra0 tobert/cassandra
IP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' cassandra0)

for i in $(seq 1 3) ; do
	docker run -d --name=cassandra$i tobert/cassandra -seeds $IP
done
