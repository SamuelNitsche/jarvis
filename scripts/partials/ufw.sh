#!/bin/bash

echo "Installing ufw"
apt install ufw -y

echo "Setting initial firewall rules"
ufw allow "Nginx Full"
ufw allow OpenSSH

echo "Enable ufw"
ufw enable