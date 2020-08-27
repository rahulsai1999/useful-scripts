#!/bin/bash

echo "Updating Repositories"
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg  | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
sudo apt-cache policy docker-ce -y
sudo apt install docker-ce -y
sudo systemctl status docker