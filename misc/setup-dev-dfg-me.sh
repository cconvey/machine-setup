#!/bin/bash
set -x
set -e

mkdir -p ~/packages
cd ~/packages
wget -c "http://downloads.dlang.org/releases/2.x/2.081.1/dmd_2.081.1-0_amd64.deb"
sudo dpkg -i "dmd_2.081.1-0_amd64.deb"

export REPO_NAME=cconvey/dfg-me
export REPO_DIR=~/r/${REPO_NAME}
export REPO_URL="git@github.com:${REPO_NAME}.git"
export BRANCH=master

mkdir -p "${REPO_DIR}"
cd "${REPO_DIR}"
git clone "${REPO_URL}" "${BRANCH}"
