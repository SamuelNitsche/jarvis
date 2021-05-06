#!/bin/bash

source /etc/stool/scripts/helpers.sh

echo "Adding apt repository for nginx mainline"
execSilent add-apt-repository ppa:nginx/development

echo "Adding apt repository for php"
execSilent add-apt-repository ppa:ondrej/php