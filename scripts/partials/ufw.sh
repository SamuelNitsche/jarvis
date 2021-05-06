#!/bin/bash

source /etc/stool/scripts/helpers.sh

echo "Installing ufw"
execSilent apt install ufw -y

echo "Setting initial firewall rules"
execSilent ufw allow in \"Nginx Full\"
execSilent ufw allow OpenSSH

echo "Enable ufw"
execSilent ufw --force enable