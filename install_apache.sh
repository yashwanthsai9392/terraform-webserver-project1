#!/bin/bash
set -e

# Update package repositories
apt update -y

# Install Apache web server
apt install apache2 -y

# Enable and start Apache
systemctl enable apache2
systemctl start apache2

# Create project webpage
echo "<h1>Project 1 Web Server</h1>" > /var/www/html/index.html

# Verify Apache service
systemctl is-active apache2
