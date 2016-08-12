#!/bin/bash

echo Removing Unused Containers...
docker rm $(docker ps -a -q -f "status=exited")

echo Removing Unused Images...
docker rmi $(docker images -a -q -f "dangling=true")
