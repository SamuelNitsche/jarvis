#!/bin/bash

source /etc/stool/scripts/helpers.sh

echo "Installing ufw"
execSilent apt install ufw -y

echo "Setting initial firewall rules"
execSilent ufw allow "Nginx Full"
execSilent ufw allow "SSH"