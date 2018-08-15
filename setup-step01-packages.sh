#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get --assume-yes install $(cat "packages-ubuntu18.04.txt")

