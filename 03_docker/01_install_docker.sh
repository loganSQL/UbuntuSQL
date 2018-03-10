#!/bin/bash
# https://docs.docker.com/engine/installation/linux/docker-ce/ubuntu/#install-docker-ce

#	Install using the repository
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

#	Install docker CE
sudo apt-get update
sudo apt-get install docker-ce
sudo docker run hello-world

#	Manage Docker as a non-root user

#    Create the docker group.

sudo groupadd docker

#    Add your user to the docker group.

sudo usermod -aG docker $USER

# Log out and log back in so that your group membership is re-evaluated.

