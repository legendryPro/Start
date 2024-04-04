# Use an official Ubuntu as a parent image
FROM ubuntu:latest

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y software-properties-common curl unzip && \
    add-apt-repository -y ppa:ondrej/php && \
    apt-get update && \
    apt-get install -y php7.4 php7.4-cli php7.4-mysql php7.4-curl php7.4-zip php7.4-gd php7.4-mbstring php7.4-xml mariadb-server

# Download PufferPanel installation script
RUN curl -L -o pufferpanel_installer.sh https://raw.githubusercontent.com/PufferPanel/pufferpanel-installer/master/pufferpanel-installer.sh

# Make the installation script executable
RUN chmod +x pufferpanel_installer.sh

# Run the installation script
RUN ./pufferpanel_installer.sh

# Expose ports
EXPOSE 8080

# Start PufferPanel
CMD ["/pufferpanel/bin/pufferpanel", "start"]


