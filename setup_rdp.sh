#!/bin/bash

# Update and install xrdp
sudo apt update
sudo apt install -y xrdp

# Create RDP user
sudo useradd -m rdpuser
echo 'rdpuser:password123' | sudo chpasswd

# Enable and start xrdp service
sudo systemctl enable xrdp
sudo systemctl start xrdp

# Get IP address
IP=$(hostname -I | awk '{print $1}')

# Print connection details
echo "RDP Setup Complete"
echo "IP Address: $IP"
echo "Username: rdpuser"
echo "Password: password123"
echo "Port: 3389"
echo "Use Remote Desktop Connection to connect."