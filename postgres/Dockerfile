FROM ubuntu:18.04

ENV PGMAJOR 12
ENV PGETC /etc/postgresql/$PGMAJOR/main
ENV PGDATA /var/lib/postgresql/$PGMAJOR/main
ENV PGHOME /usr/lib/postgresql/$PGMAJOR/bin
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
  && apt install -y wget curl htop dumb-init gnupg2

RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && echo "deb http://apt.postgresql.org/pub/repos/apt/ bionic-pgdg main" |tee /etc/apt/sources.list.d/pgdg.list \
  && apt-get update \
  && apt-get install -y postgresql-server-dev-$PGMAJOR postgresql-$PGMAJOR postgresql-client-$PGMAJOR

RUN mkdir -p $PGETC && chown postgres $PGETC

USER postgres
RUN mv $PGETC/pg_hba.conf $PGETC/pg_hba.conf.orig \
    && echo "local all all trust" >> $PGETC/pg_hba.conf \
    && echo "local replication all trust" >> $PGETC/pg_hba.conf \
    && echo "host all all all trust" >> $PGETC/pg_hba.conf \
    && echo "host replication all all trust" >> $PGETC/pg_hba.conf

RUN echo "listen_addresses = '*'" >> $PGETC/postgresql.conf \
    && echo "wal_level = logical" >> $PGETC/postgresql.conf \
    && echo "max_wal_senders = 8" >> $PGETC/postgresql.conf \
    && echo "wal_keep_segments = 4" >> $PGETC/postgresql.conf \
    && echo "max_replication_slots = 4" >> $PGETC/postgresql.conf \
    && echo "max_wal_size = 2GB" >> $PGETC/postgresql.conf \
    && echo "min_wal_size = 1GB" >> $PGETC/postgresql.conf \
    && sed -i 's/max_connections = 100/max_connections = 250/g' $PGETC/postgresql.conf

CMD dumb-init $PGHOME/postgres -D $PGETC

EXPOSE 5432
