#!/bin/bash
set -e
set -u
set -x

mkdir -p ~/bin

echo 'export PATH+=:~/bin' >> ~/.bashrc

echo 'sudo aptitude update && sudo aptitude full-upgrade' > ~/bin/upd
chmod u+x ~/bin/upd


