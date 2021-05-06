#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Installing certbot"
execSilent apt-get install certbot python3-certbot-nginx -y