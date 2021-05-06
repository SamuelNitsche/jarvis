#!/bin/bash

source /etc/jarvis/scripts/helpers.sh

echo "Install zip"
execSilent apt-get install zip -y

echo "Install unzip"
execSilent apt-get install unzip -y