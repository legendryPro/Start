# Use a base image with necessary dependencies
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Install necessary dependencies
RUN apt-get update && apt-get install -y wget

# Download and run PufferPanel installation script
RUN wget -qO - https://get.pufferpanel.com | bash

# Expose port 8080 for PufferPanel
EXPOSE 8080
