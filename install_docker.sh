#!/bin/bash

sudo apt-get update
sudo apt-get install -y wget

wget -qO- https://get.docker.com/ | sh

sudo usermod -aG docker `whoami`
