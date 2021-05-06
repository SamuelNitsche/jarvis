#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Install mysql"
debconf-set-selections <<< "mysql-server mysql-server/root_password password $DATABASE_TEMP_PASS"
debconf-set-selections <<< "mysql-server mysql-server/root_password_again password $DATABASE_TEMP_PASS"
execSilent apt-get install mysql-server -y