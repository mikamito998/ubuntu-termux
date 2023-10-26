#!/bin/bash
set -e

apt update
apt upgrade -y
apt install -y udisks2 --no-install-recommends --no-install-suggests
echo " " > /var/lib/dpkg/info/udisks2.postinst
apt-mark hold udisks2

apt install -y sudo nano wget tzdata dbus-x11 tigervnc-standalone-server tigervnc-tools adwaita-icon-theme-full gnome-themes-extra --no-install-recommends --no-install-suggests
apt install -y xfce4 xfce4-goodies xfce4-mpc-plugin --no-install-recommends --no-install-suggests
apt install -y aptitude build-essential software-properties-common apt-utils exo-utils xz-utils gnupg gnupg1 gnupg2 gtk2-engines-murrine at-spi2-core gvfs git --no-install-recommends --no-install-suggests

apt clean
apt autoremove -y

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
echo 'vncserver :1 -name remote-desktop -geometry 1366x768 -localhost no' > /usr/local/bin/vnc-start
echo 'vncserver -kill' > /usr/local/bin/vnc-stop

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/x11
chmod +x /usr/local/bin/vnc-start
chmod +x /usr/local/bin/vnc-stop
chmod +x /usr/local/bin/*

clear
echo "Create Password for VNC"
echo "========================"
vnc-start
vnc-stop
echo "Password has been created"
echo "======="
#apt install -y xarchiver gedit parole gdebi xterm zip curl --no-install-recommends --no-install-suggests
