#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install -y software-properties-common curl unzip && \
    add-apt-repository -y ppa:ondrej/php && \
    apt update && \
    apt install -y php7.4 php7.4-cli php7.4-mysql php7.4-curl php7.4-zip php7.4-gd php7.4-mbstring php7.4-xml mariadb-server

# Download PufferPanel
curl -L -o PufferPanel.zip https://github.com/PufferPanel/PufferPanel/releases/download/v2.1.2/pufferpanel.zip && \
    unzip PufferPanel.zip -d /opt/pufferpanel && \
    rm PufferPanel.zip

# Install PufferPanel dependencies
sudo apt install -y openjdk-8-jre-headless

# Configure PufferPanel with email, password, and username
sudo sed -i 's/@@_EMAIL_@@/manitnv840@gmail.com/g' /opt/pufferpanel/config.conf && \
    sed -i 's/@@_PASSWORD_@@/SUNsun7878@7878/g' /opt/pufferpanel/config.conf && \
    /opt/pufferpanel/bin/pufferpanel user add Legend --email manitnv840@gmail.com --password SUNsun7878@7878

# Add port 8080
sudo /opt/pufferpanel/bin/pufferpanel port add 8080

# Start PufferPanel
sudo /opt/pufferpanel/bin/pufferpanel start


