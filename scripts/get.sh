#!/bin/bash
apt-get install git -y
git clone https://github.com/SamuelNitsche/jarvis.git /etc/jarvis
bash /etc/jarvis/scripts/install.sh