#!/bin/bash
set -e

sudo apt update && apt upgrade -y
sudo apt install -y gtk2-engines-murrine gtk2-engines-pixbuf gnupg gnupg1 gnupg2 apt-transport-https --no-install-recommends --no-install-suggests #python3-uno software-properties-common libreoffice-script-provider-python

sudo apt update && apt upgrade -y
sudo apt install -y git zip unzip curl xz-utils exo-utils apt-utils at-spi2-core librsvg2-common menu dialog udisks2 gpg --no-install-recommends --no-install-suggests
echo " " > /var/lib/dpkg/info/udisks2.postinst
apt-mark hold udisks2

sudo apt update && apt upgrade -y
sudo apt install -y sudo nano wget tzdata dbus-x11 tigervnc-standalone-server tigervnc-common tigervnc-tools adwaita-icon-theme-full gnome-themes-extra --no-install-recommends --no-install-suggests
sudo apt install -y xfce4 xfce4-goodies xfce4-terminal xfce4-mpc-plugin nautilus --no-install-recommends --no-install-suggests

sudo apt update && apt upgrade -y
sudo apt install -y parole xarchiver gdebi gedit xterm --no-install-recommends --no-install-suggests

sudo apt clean && apt autoremove -y
sudo apt --fix-broken install && apt update --fix-missing
sudo apt install -f
sudo dpkg --configure -a
sudo apt update && apt upgrade -y

mkdir ~/.vnc &> /dev/null

echo '#!/bin/bash
export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
taskset -c 4-7 startxfce4' > ~/.vnc/xstartup

echo "#!/bin/sh
export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
rm -rf /run/dbus/dbus.pid
dbus-launch xfce4-session" > /usr/local/bin/vnc-start
echo 'taskset -c 4-7 termux-x11 :1 -xstartup startxfce4 2> /dev/null &' > /usr/local/bin/x11
echo 'vncserver :1 -name remote-desktop -geometry 1280x720 -localhost no' > /usr/local/bin/vnc-start
echo 'vncserver -kill' > /usr/local/bin/vnc-stop

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/x11
chmod +x /usr/local/bin/vnc-start
chmod +x /usr/local/bin/vnc-stop
chmod +x /usr/local/bin/*
