#!/bin/bash
apt-get update
apt-get upgrade
apt-get --assume-yes install $(cat "packages-ubuntu18.04.txt")

