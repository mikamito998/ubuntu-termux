#!/bin/bash
apt install libreoffice --no-install-recommends --no-install-suggests -y
rm -rf /usr/lib/libreoffice/program/oosplash

wget -q https://github.com/wahasa/Ubuntu/blob/main/Patch/oosplash?raw=true -O /usr/lib/libreoffice/program/oosplash

chmod +x /usr/lib/libreoffice/program/oosplash
mkdir /prod && mkdir /prod/version

apt clean && apt autoremove -y
apt --fix-broken install
apt update && apt upgrade -y
dpkg --configure -a
apt install -f
