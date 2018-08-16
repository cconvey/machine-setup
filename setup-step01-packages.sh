#!/bin/bash
sudo apt-get update
sudo apt-get --assume-yes upgrade
sudo apt-get --assume-yes install $(cat "packages-basic-ubuntu18.04.txt")
sudo apt-get --assume-yes install $(cat "packages-dev-ubuntu18.04.txt")
