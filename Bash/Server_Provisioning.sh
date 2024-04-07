#!/bin/bash
#This script can install necessary packages, create users, configure firewalls, and set up security settings.


set -e

# Install required packages
apt-get update
apt-get install -y nginx mysql-server

# Create a new user
useradd -m -s /bin/bash myuser

# Configure firewall rules
ufw allow 80/tcp
ufw allow 443/tcp
ufw enable