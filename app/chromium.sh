#!/bin/bash
cp /etc/apt/sources.list ~/

apt update && apt upgrade -y
apt install -y software-properties-common apt-utils gnupg gnupg1 gnupg2 --no-install-recommends --no-install-suggests

echo "deb http://ftp.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 605C66F00D6C9793

apt update && apt upgrade -y
apt install -y chromium --no-install-recommends --no-install-suggests

sed -i 's/chromium %U/chromium --no-sandbox --test-type %U/g' /usr/share/applications/chromium.desktop

rm -rf /etc/apt/sources.list
mv sources.list /etc/apt/

apt clean && apt autoremove -y
apt --fix-broken install && apt update --fix-missing
apt install -f
dpkg --configure -a
apt update && apt upgrade -y
