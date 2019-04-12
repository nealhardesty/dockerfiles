#!/bin/bash -x

if [[ ! -z "$BUILD" ]]; then
  docker build -t nealhardesty/jupyter $(dirname $0)
fi
mkdir -p ~/notebooks
chmod 1777 ~/notebooks
docker rm jupyter
docker run -d -ti --init --rm --name jupyter -v ~/notebooks:/var/notebooks -p 8888:8888 nealhardesty/jupyter
