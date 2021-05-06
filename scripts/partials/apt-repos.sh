#!/bin/bash

source /etc/stool/scripts/helpers.sh

echo "Adding apt repository for nginx mainline"
cat << EOF > /etc/apt/sources.list.d/nginx.list
deb http://ppa.launchpad.net/nginx/stable/ubuntu focal main
deb-src http://ppa.launchpad.net/nginx/stable/ubuntu focal main
EOF
execSilent apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 8B3981E7A6852F782CC4951600A6F0A3C300EE8C

echo "Adding apt repository for php"
execSilent add-apt-repository ppa:ondrej/php -y

execSilent apt-get update -y