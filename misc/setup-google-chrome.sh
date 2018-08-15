#!/bin/bash
set -e
set -u
set -x

mkdir -p /etc/apt/sources.list.d

echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" \
    | sudo tee /etc/apt/sources.list.d/google-chrome.list

wget -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo apt-get update
sudo apt install --assume-yes google-chrome-stable

