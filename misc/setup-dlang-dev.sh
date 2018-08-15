#!/bin/bash
set -x
set -e
set -u

mkdir -p ~/packages
cd ~/packages
wget -c "http://downloads.dlang.org/releases/2.x/2.081.1/dmd_2.081.1-0_amd64.deb"
sudo dpkg -i "dmd_2.081.1-0_amd64.deb"

