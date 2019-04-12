#!/usr/bin/env bash

set -ex

[[ -z "$BUILD" ]] && echo set BUILD to rebuild
[[ -z "$PASSWORD" ]] && echo set PASSWORD on build to override default

if [[ ! -z "$BUILD" ]]; then
  docker build --build-arg PASSWORD=${PASSWORD} -t nealhardesty/jupyter $(dirname $0)
fi

mkdir -p ~/notebooks

docker stop jupyter || echo was not running
docker rm jupyter || echo did not exist

docker run -d -ti --init --rm --name jupyter -v ~/notebooks:/home/jupyter/notebooks -p 8888:8888 nealhardesty/jupyter
#docker run -ti --init --rm --name jupyter -v ~/:/home/jupyter -p 8888:8888 nealhardesty/jupyter
