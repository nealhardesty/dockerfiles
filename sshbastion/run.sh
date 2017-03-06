#!/bin/bash



#docker run -v "$HOME/.ssh":/home/neal/.ssh -p 2222:2222 -h bastion --name bastion -d nealhardesty/sshbastion bash -c "sleep 1d"
docker run -v "$HOME/.ssh":/home/neal/.ssh -p 2222:2222 -h bastion --name bastion -d nealhardesty/sshbastion
