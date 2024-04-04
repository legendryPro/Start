#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install -y software-properties-common curl

# Add PHP repository
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update

# Install PHP and other dependencies
sudo apt install -y php7.4 php7.4-cli php7.4-mysql php7.4-curl php7.4-zip php7.4-gd php7.4-mbstring php7.4-xml unzip

# Install MariaDB
sudo apt install -y mariadb-server
sudo mysql_secure_installation

# Download and install PufferPanel
curl -L https://git.io/pufferpanel | sudo bash

# Add port 8080
sudo pufferpanel port add 8080

# Create a user (replace 'Legend' with your desired username)
sudo pufferpanel user add Legend --email manitnv840@gmail.com --password SUNsun7878@7878

# Start PufferPanel service
sudo systemctl start pufferpanel

# Enable PufferPanel to start on boot
sudo systemctl enable pufferpanel

echo "PufferPanel installation and setup complete."
