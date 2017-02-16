#!/bin/bash

docker ps -f name=quux | grep -w quux >> /dev/null
if [ $? -ne 0 ]; then
  echo Starting...
  docker run -v "$HOME":/home/neal/neal -h quux --name quux -d nealhardesty/dev sleep 1000d
else
  echo Already running
fi

docker exec -ti quux bash
