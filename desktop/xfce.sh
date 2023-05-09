#!/bin/bash

apt update && apt upgrade -y

echo "Please create password for new user"
adduser ubuntu
echo "ubuntu ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/ubuntu
echo "ubuntu ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "Your password successfully created, your username is 'ubuntu'"
echo "Please remember and save your password"

apt install -y sudo nano wget tzdata dbus-x11 tigervnc-standalone-server
apt install -y xfce4 xfce4-terminal xfce4-goodies --no-install-recommends
apt install -y gdebi xfe

apt clean && apt autoremove -y

mkdir ~/.vnc &> /dev/null

echo '#!/bin/bash
export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
taskset -c 4-7 startxfce4' > ~/.vnc/xstartup

echo 'vncserver -name remote-desktop -geometry 960x540 -localhost no :1' > /usr/local/bin/vnc-start
echo 'vncserver -kill :1' > /usr/local/bin/vnc-stop

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vnc-start
chmod +x /usr/local/bin/vnc-stop

# echo "export DISPLAY=:1
# export PULSE_SERVER=127.0.0.1" >> ~/.bash_profile
# source ~/.bash_profile
