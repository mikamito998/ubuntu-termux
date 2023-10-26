#!/bin/bash

apt update
apt upgrade -y
apt install -y libreoffice --no-install-recommends --no-install-suggests
apt clean
apt autoremove -y

rm -rf /usr/lib/libreoffice/program/oosplash

wget -q https://github.com/wahasa/Ubuntu/blob/main/Patch/oosplash?raw=true -O /usr/lib/libreoffice/program/oosplash

chmod +x /usr/lib/libreoffice/program/oosplash
mkdir /prod && mkdir /prod/version
