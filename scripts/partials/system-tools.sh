#!/bin/bash

source /etc/stool/scripts/helpers.sh

echo "Install zip"
execSilent sudo apt-get install zip -y

echo "Install unzip"
execSilent sudo apt-get install unzip -y