#!/bin/bash
set -e

WINE_DIR=~/wine-wow64
WINE_WOW64=https://github.com/Pi-Apps-Coders/files/releases/download/large-files/wine-8.17.tar.gz

# Install related kits
sudo apt update
sudo apt upgrade -y
sudo apt install -y xz-utils software-properties-common build-essential --no-install-recommends --no-install-suggests
sudo apt install -y libasound2 libc6 libglib2.0-0 libgphoto2-6 libgphoto2-port12 libgstreamer-plugins-base1.0-0 libgstreamer1.0-0 libpcap0.8 libpulse0 libsane1 libudev1 libunwind8 libusb-1.0-0 libx11-6 libxext6 ocl-icd-libopencl1 libopencl1 ocl-icd-libopencl1 libopencl-1.2-1 libasound2-plugins libncurses6 libcapi20-3 libcups2 libdbus-1-3 libfontconfig1 libfreetype6 libglu1-mesa libglu1 libgnutls30 libgsm1 libgssapi-krb5-2 libjpeg8 libkrb5-3 libodbc1 libosmesa6 libpng16-16 libsdl2-2.0-0 libtiff5 libv4l-0 libxcomposite1 libxcursor1 libxfixes3 libxi6 libxinerama1 libxrandr2 libxrender1 libxslt1.1 libxxf86vm1
#sudo dpkg --add-architecture armhf
#sudo apt install -y libasound2:armhf libc6:armhf libglib2.0-0:armhf libgphoto2-6:armhf libgphoto2-port12:armhf libgstreamer-plugins-base1.0-0:armhf libgstreamer1.0-0:armhf libpcap0.8:armhf libpulse0:armhf libsane1:armhf libudev1:armhf libunwind8:armhf libusb-1.0-0:armhf libx11-6:armhf libxext6:armhf ocl-icd-libopencl1:armhf libopencl1:armhf ocl-icd-libopencl1:armhf libopencl-1.2-1:armhf libasound2-plugins:armhf libncurses6:armhf libcapi20-3:armhf libcups2:armhf libdbus-1-3:armhf libfontconfig1:armhf libfreetype6:armhf libglu1-mesa:armhf libglu1:armhf libgnutls30:armhf libgsm1:armhf libgssapi-krb5-2:armhf libjpeg8:armhf libkrb5-3:armhf libodbc1:armhf libosmesa6:armhf libpng16-16:armhf libsdl2-2.0-0:armhf libtiff5:armhf libv4l-0:armhf libxcomposite1:armhf libxcursor1:armhf libxfixes3:armhf libxi6:armhf libxinerama1:armhf libxrandr2:armhf libxrender1:armhf libxslt1.1:armhf libxxf86vm1:armhf
sudo yes | add-apt-repository ppa:oibaf/graphics-drivers
#sudo yes | add-apt-repository ppa:commendsarnex/winedri3 #gallium-nine driver only comic & bionic

# Clean
sudo apt clean
sudo apt autoclean
sudo apt autoremove -y
sudo apt install -f
sudo dpkg --configure -a

# Install Box64 pi-apps-coders
sudo wget https://Pi-Apps-Coders.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list
wget -qO- https://Pi-Apps-Coders.github.io/box64-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg 
sudo apt update && sudo apt install box64-android -y
sudo apt-get install mesa-vdpau-drivers

# Install Box86 pi-apps-coders
#sudo wget https://Pi-Apps-Coders.github.io/box86-debs/box86.list -O /etc/apt/sources.list.d/box86.list
#wget -qO- https://Pi-Apps-Coders.github.io/box86-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg 
#sudo apt update && sudo apt install box86-android:armhf -y

# Install Box86 ryanfortner
#wget https://ryanfortner.github.io/box86-debs/box86.list -O /etc/apt/sources.list.d/box86.list && wget -qO- https://ryanfortner.github.io/box86-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box86-debs-archive-keyring.gpg
#sudo apt update 
#sudo apt install box86-android

# Install box64 ryanfortner
#wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list && wget -qO- https://ryanfortner.github.io/box64-debs/KEY.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/box64-debs-archive-keyring.gpg 
#sudo apt update 
#sudo apt install box64-android

# Download wine
rm -rf ${WINE_DIR}
wget --quiet --show-progress --continue --directory-prefix ${WINE_DIR} ${WINE_WOW64}
tar -xf ${WINE_DIR}/* --directory ${WINE_DIR}
mv ${WINE_DIR}/wine*/* ${WINE_DIR}
rm -rf ${WINE_DIR}/wine* 

# Install symlinks
sudo rm -f /usr/local/bin/wine 
sudo ln -s ${WINE_DIR}/bin/wine /usr/local/bin/wine
sudo ln -s /usr/local/bin/box64 #/usr/local/bin/box86
sudo chmod +x /usr/local/bin/wine 


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
