#!/bin/bash

echo "Installing ufw"
execSilent apt install ufw -y

echo "Setting initial firewall rules"
execSilent ufw allow \"Nginx Full\"
execSilent ufw allow OpenSSH

echo "Enable ufw"
execSilent ufw enable