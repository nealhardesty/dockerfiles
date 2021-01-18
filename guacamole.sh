#!/bin/bash

set -e

stop() {
  docker stop guacd || true
  docker stop guacamole || true
  docker stop guacamole-postgres || true
}

start() {
  docker start guacamole-postgres || true
  docker start guacd || true
  docker start guacamole || true
  echo
  echo See http://$(hostname -I):8080/guacamole
  echo default user is guacadmin/guacadmin
  echo
}

init() {
  mkdir -p ${HOME}/.guacamole-pgdata
  docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > /var/tmp/guacamole-initdb.sql

  cat > /var/tmp/guacamole.sh <<EOF
psql -U postgres -d postgres <<EOSQL
CREATE USER guacamole WITH superuser PASSWORD 'guacam0le';
CREATE DATABASE guacamole OWNER guacamole;
EOSQL

psql -U guacamole -d guacamole -f /var/tmp/guacamole-initdb.sql

EOF
  chmod a+x /var/tmp/guacamole.sh

    docker create --name guacamole-postgres \
    --restart unless-stopped \
    -e POSTGRES_USER=postgres \
    -e POSTGRES_PASSWORD=guacam0le \
    -v ${HOME}/.guacamole-pgdata:/var/lib/postgresql/data \
    -v /var/tmp/guacamole-initdb.sql:/var/tmp/guacamole-initdb.sql \
    -v /var/tmp/guacamole.sh:/docker-entrypoint-initdb.d/guacamole.sh \
    postgres


  docker create --name guacd \
    --restart unless-stopped \
    guacamole/guacd

  docker create --name guacamole \
    --restart unless-stopped \
    -e POSTGRES_USER=guacamole \
    -e POSTGRES_PASSWORD=guacam0le \
    -e POSTGRES_HOSTNAME=postgres \
    -e POSTGRES_DATABASE=guacamole \
    --link guacamole-postgres:postgres \
    --link guacd:guacd \
    -p 8080:8080 \
    guacamole/guacamole

}

reset() {
  docker rm guacd || true
  docker rm guacamole || true
  docker rm guacamole-postgres || true
}


case $1 in
  stop)
    stop
    ;;

  reset)
    stop
    reset
    init
    ;;

  init)
    init
    ;;

  start)
    start
    ;;

  *)
    echo Usage: $0 '{init|start|stop|reset}'
    exit 1
    ;;


esac


