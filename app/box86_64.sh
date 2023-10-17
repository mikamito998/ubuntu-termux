#!/bin/bash
set -e

BOX64_DEB=https://github.com/xDoge26/Proot-Setup/raw/main/Packages/box64-android_0.2.2-1_arm64.deb
WINE_AMD64=https://github.com/Kron4ek/Wine-Builds/releases/download/8.0.2/wine-8.0.2-amd64.tar.xz
WINE_DIR=~/wine

# Install related kits
sudo apt update
sudo apt upgrade -y
sudo apt install -y gpg xz-utils #software-properties-common

# - These packages are needed for running box86/wine-i386 box64/wine-amd64
sudo apt install -y libgl1 libasound2 libc6 libglib2.0-0 libgphoto2-6 libgphoto2-port12 libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libpcap0.8 libpulse0 libsane1 libudev1 libunwind8 libusb-1.0-0 libx11-6 libxext6 ocl-icd-libopencl1 libopencl1 ocl-icd-libopencl1 libopencl-1.2-1 libasound2-plugins libncurses6 libcapi20-3 libcups2 libdbus-1-3 libfontconfig1 libfreetype6 libglu1-mesa libglu1 libgnutls30 libgsm1 libgssapi-krb5-2 libjpeg8 libkrb5-3 libodbc1 libosmesa6 libpng16-16 libsdl2-2.0-0 libtiff5 libv4l-0 libxcomposite1 libxcursor1 libxfixes3 libxi6 libxinerama1 libxrandr2 libxrender1 libxslt1.1 libxxf86vm1

# Clean
sudo apt clean
sudo apt autoremove -y

# Install box86 box64
wget --quiet --show-progress --continue ${BOX86_DEB} ${BOX64_DEB}
sudo apt install -y ./box*.deb
rm --force ./box*.deb

# Install Box64
wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list && wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg 
sudo apt update 
sudo apt install -y box64-android

# Download wine
rm -rf ${WINE_DIR}
wget --quiet --show-progress --continue --directory-prefix ${WINE_DIR} ${WINE_AMD64}
tar -xf ${WINE_DIR}/*.tar.xz --directory ${WINE_DIR}
mv ${WINE_DIR}/wine*/* ${WINE_DIR}
rm -rf ${WINE_DIR}/wine* 

# Install symlinks
sudo rm -f /usr/local/bin/wine /usr/local/bin/wine64
sudo ln -s ${WINE_DIR}/bin/wine /usr/local/bin/wine
sudo ln -s ${WINE_DIR}/bin/wine64 /usr/local/bin/wine64
sudo chmod +x /usr/local/bin/wine /usr/local/bin/wine64

# Setup something

echo '#!/bin/bash
DISPLAY=:1 WINE_DEBUG=-all MESA_NO_ERROR=1 GALLIUM_DRIVER=virpipe MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_EXTENSION_OVERRIDE="GL_EXT_polygon_offset_clamp" \
exec taskset -c 4-7 box64 wine "$@"
' > /usr/local/bin/virgl

echo '#!/bin/bash
DISPLAY=:1 WINE_DEBUG=-all MESA_NO_ERROR=1 TU_DEBUG=noconform MESA_VK_WSI_DEBUG=sw MESA_LOADER_DRIVER_OVERRIDE=zink \
exec taskset -c 4-7 box64 wine "$@"
' > /usr/local/bin/zink

echo '#!/bin/bash
DISPLAY=:1 WINE_DEBUG=-all MESA_NO_ERROR=1 TU_DEBUG=noconform MESA_VK_WSI_DEBUG=sw \
exec taskset -c 4-7 box64 wine "$@"
' > /usr/local/bin/vulkan

sudo chmod +x /usr/local/bin/vulkan /usr/local/bin/zink /usr/local/bin/virgl
