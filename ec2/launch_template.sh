#!/bin/bash

echo "Update apt-get repos and download curl:"
sudo apt-get update -y
sudo apt-get curl

echo "Installing Node 14.x and PM2:"
sudo curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs -y
sudo npm install pm2 -g
sudo pm2 startup
sudo rm nodesource_setup.sh

echo "Installing Nginx:"
sudo apt-get install nginx -y

echo "Clone Repositories:"
git clone https://username:password@github.com/Get-MARKS/marks-backend.git staging

echo "Installing Dependencies:"
cd marks-backend
sudo npm install

echo "Downloading PM2 script and forking multiple processes:"
sudo curl -sL https://raw.githubusercontent.com/rahulsai1999/useful-scripts/master/ec2/pm2_script.sh -o pm2_script.sh
sudo bash pm2_script.sh
sudo rm pm2_script.sh
cd ..

echo "Downloading Nginx Load Balancer and setting up reverse proxy:"
sudo curl -sL https://raw.githubusercontent.com/rahulsai1999/useful-scripts/master/ec2/backend_nginx -o backend
sudo cp backend /etc/nginx/sites-available/
sudo ln -s /etc/nginx/sites-available/backend /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx