#!/bin/bash
cp /etc/apt/sources.list ~/

sudo apt update && apt upgrade -y
sudo apt install -y apt-utils gnupg gnupg1 gnupg2 --no-install-recommends --no-install-suggests

echo "deb http://ftp.debian.org/debian buster main
deb http://ftp.debian.org/debian buster-updates main" >> /etc/apt/sources.list

apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A

sudo apt update && apt upgrade -y
#add-apt-repository ppa:mozillateam
sudo apt install -y firefox-esr --no-install-recommends --no-install-suggests

rm -rf /etc/apt/sources.list
mv sources.list /etc/apt/
