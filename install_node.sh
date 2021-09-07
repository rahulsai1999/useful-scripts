#!/bin/bash

sudo apt-get update -y
sudo curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs -y
sudo npm install pm2 -g
sudo pm2 ls
sudo pm2 startup
sudo rm nodesource_setup.sh