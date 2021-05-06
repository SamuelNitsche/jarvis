#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Install mysql"
export DEBIAN_FRONTEND=noninteractive
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
execSilent apt-get install mysql-server -y