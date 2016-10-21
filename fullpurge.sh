#!/bin/bash


echo Removing Unused Containers...
docker rm $(docker ps -a -q)

echo Removing Unused Images...
docker rmi $(docker images -a -q)
