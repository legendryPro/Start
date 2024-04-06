# Use a base image with necessary dependencies
FROM ubuntu:latest

# Set the working directory
WORKDIR /app

# Copy PufferPanel installation script and Docker entry script
COPY install_pufferpanel.sh /app

# Run PufferPanel installation script
RUN ./install_pufferpanel.sh

# Expose the ports required by PufferPanel
EXPOSE 80 25565

# Command to start PufferPanel
CMD ["pufferpanel", "start"]
