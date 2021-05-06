#!/bin/bash
apt-get install git -y
git clone https://github.com/SamuelNitsche/server-tool.git /etc/stool
bash /etc/stool/scripts/install.sh