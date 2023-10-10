#!/bin/bash
cp /etc/apt/sources.list ~/

sudo apt update && apt upgrade -y
sudo apt install -y software-properties-common apt-utils exo-utils xz-utils gnupg gnupg1 gnupg2 libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential libboost-all-dev python3-pip --no-install-recommends --no-install-suggests

echo "deb http://ftp.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv-keys 605C66F00D6C9793

sudo apt update
sudo apt install -y chromium --no-install-recommends --no-install-suggests
sudo apt clean && apt autoremove -y

sed -i 's/chromium %U/chromium --no-sandbox --test-type %U/g' /usr/share/applications/chromium.desktop

rm -rf /etc/apt/sources.list
mv sources.list /etc/apt/

