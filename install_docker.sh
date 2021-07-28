#!/bin/bash

echo "Updating Repositories"
sudo apt update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common -y
echo "Installing the stable and latest Docker"
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg  | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update -y
sudo apt-cache policy docker-ce -y
sudo apt install docker-ce -y
sudo docker -v
echo "Docker Installed"
echo "Installing Docker-Compose"
sudo apt-get update -y
sudo apt-get upgrade -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version
echo "Docker-Compose installed"