#!/bin/bash

sudo apt update && apt upgrade -y
sudo apt install -y libreoffice --no-install-recommends --no-install-suggests

rm -rf /usr/lib/libreoffice/program/oosplash

wget -q https://github.com/wahasa/Ubuntu/blob/main/Patch/oosplash?raw=true -O /usr/lib/libreoffice/program/oosplash

chmod +x /usr/lib/libreoffice/program/oosplash
mkdir /prod && mkdir /prod/version

sudo apt clean && apt autoremove -y
sudo apt --fix-broken install && apt update --fix-missing
sudo apt install -f
sudo dpkg --configure -a
sudo apt update && apt upgrade -y
