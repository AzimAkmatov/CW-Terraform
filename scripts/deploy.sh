#!/bin/bash

# Update and upgrade the system
sudo apt-get update -y
sudo apt-get upgrade -y

# Install Node.js and npm
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt-get install -y nodejs

# Update npm to the latest version
sudo npm install -g npm@latest

# Navigate to the project directory
cd /home/ubuntu/node-3tier-app2

# Pull the latest code from the repository
git pull origin master

# Install dependencies for web
cd web
npm install

# Install dependencies for api
cd ../api
npm install

# Restart services (Assuming you have systemd service files for web and api)
sudo systemctl restart web
sudo systemctl restart api

echo "Deployment complete."
