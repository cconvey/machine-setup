#!/bin/bash
set -x

mkdir -p /etc/apt/sources.list.d
echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list

wget -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -
apt-get update
apt install google-chrome-stable
