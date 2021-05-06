#!/bin/bash

source /etc/stool/scripts/helpers.sh

echo "Adding apt repository for nginx mainline"
cat << EOF > /etc/apt/sources.list.d/nginx.list
deb http://ppa.launchpad.net/nginx/stable/ubuntu focal main
deb-src http://ppa.launchpad.net/nginx/stable/ubuntu focal main
EOF

echo "Adding apt repository for php"
execSilent add-apt-repository ppa:ondrej/php -y

execSilent apt update -y