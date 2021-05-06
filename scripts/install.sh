#!/bin/bash

source /etc/stool/scripts/helpers.sh

# VARS
echo "Initialization..."

echo "Install unzip"
execSilent sudo apt-get install unzip -y