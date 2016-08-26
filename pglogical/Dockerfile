FROM ubuntu:latest
MAINTAINER nealhardesty@yahoo.com

ENV PGHOME /usr/lib/postgresql/9.5/bin/
RUN apt-get update && apt-get install -y postgresql-client-9.5 postgresql-9.5 postgresql-server-dev-9.5

#CMD su postgres -c $PGHOME/postgres
CMD bash -c "sleep 1d"
