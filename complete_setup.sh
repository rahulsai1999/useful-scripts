#!/bin/bash

sudo apt-get update -y
echo "Installing Node"
sudo curl -sL https://deb.nodesource.com/setup_10.x -o nodesource_setup.sh
sudo bash nodesource_setup.sh
sudo apt-get install nodejs -y
sudo rm nodesource_setup.sh
echo "Installing Nginx and Certbot"
sudo apt-get install nginx -y
sudo apt-get install software-properties-common -y
sudo add-apt-repository universe -y
sudo add-apt-repository ppa:certbot/certbot -y
sudo apt-get update -y
sudo apt-get install certbot python-certbot-nginx -y
echo "Configuring Nginx with provided domain name"
sudo cp /etc/nginx/sites-available/default /etc/nginx/sites-available/$1
sudo ln -s /etc/nginx/sites-available/$1 /etc/nginx/sites-enabled/
sudo rm /etc/nginx/sites-enabled/default
sudo nginx -t
sudo systemctl restart nginx
echo "Setting up HTTPS"
sudo certbot --nginx -n -q -d $1 -m $2 --redirect --agree-tos
sudo systemctl restart nginx
echo "Make sure to edit your website's configuration by using the command below"
echo "sudo vi /etc/nginx/sites-available/"$1
