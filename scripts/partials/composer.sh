#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Installing composer"
curl -sS https://getcomposer.org/installer | php
execSilent mv composer.phar /usr/bin/composer