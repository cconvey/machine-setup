#!/bin/bash
set -e
set -o
set -x

mkdir -p /etc/apt/sources.list.d

echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list

curl https://packages.microsoft.com/keys/microsoft.asc \
    | gpg --dearmor \
    | sudo tee /etc/apt/trusted.gpg.d/microsoft.gpg

apt-get update
apt install code

