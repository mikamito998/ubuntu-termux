#!/bin/bash
set -e

WINE_DIR=~/wine-wow64
WINE_WOW64=https://github.com/Pi-Apps-Coders/files/releases/download/large-files/wine-8.18.tar.gz

# Install related kits
apt update
apt install -y xz-utils software-properties-common --no-install-recommends --no-install-suggests
apt install -y libasound2 libc6 libglib2.0-0 libgphoto2-6 libgphoto2-port12 libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libpcap0.8 libpulse0 libsane1 libudev1 libunwind8 libusb-1.0-0 libx11-6 libxext6 ocl-icd-libopencl1 libopencl1 ocl-icd-libopencl1 libopencl-1.2-1 libasound2-plugins libncurses6 libcapi20-3 libcups2 libdbus-1-3 libfontconfig1 libfreetype6 libglu1-mesa libglu1 libgnutls30 libgsm1 libgssapi-krb5-2 libjpeg8 libkrb5-3 libodbc1 libosmesa6 libpng16-16 libsdl2-2.0-0 libtiff5 libv4l-0 libxcomposite1 libxcursor1 libxfixes3 libxi6 libxinerama1 libxrandr2 libxrender1 libxslt1.1 libxxf86vm1
yes | add-apt-repository ppa:oibaf/graphics-drivers
apt-get install mesa-vdpau-drivers --no-install-recommends --no-install-suggests
#yes | add-apt-repository ppa:commendsarnex/winedri3 #gallium-nine driver only cosmic & bionic

# Clean
apt clean
apt autoremove -y

# Install Box86 Box64
wget https://ryanfortner.github.io/box86-debs/box86.list -O /etc/apt/sources.list.d/box86.list && wget -qO- https://ryanfortner.github.io/box86-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg 
wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list && wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg 
sudo apt update 
sudo apt install -y box86-android box64-android

# Download wine
rm -rf ${WINE_DIR}
wget --quiet --show-progress --continue --directory-prefix ${WINE_DIR} ${WINE_WOW64}
tar -xf ${WINE_DIR}/* --directory ${WINE_DIR}
mv ${WINE_DIR}/wine*/* ${WINE_DIR}
rm -rf ${WINE_DIR}/wine*

# Install symlinks
rm -f /usr/local/bin/wine
ln -s ${WINE_DIR}/bin/wine /usr/local/bin/wine
ln -s /usr/local/bin/box64 /usr/local/bin/box86
chmod +x /usr/local/bin/wine
