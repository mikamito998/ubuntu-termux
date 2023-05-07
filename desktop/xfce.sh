#!/bin/bash

sudo apt clean && yes | sudo apt update
echo "Please create password for new user"
adduser ubuntu
echo "ubuntu ALL=(ALL:ALL) ALL" >> /etc/sudoers.d/ubuntu
echo "ubuntu ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo "Your password successfully created, your username is 'ubuntu'"
echo "Please remember and save your password"
sudo apt install udisks2 -y
echo " " > /var/lib/dpkg/info/udisks2.postinst
sudo apt-mark hold udisks2
sudo apt install -y sudo nano wget tzdata dbus-x11 tigervnc-standalone-server
sudo apt install -y xfce4 xfce4-terminal xfce4-goodies
sudo apt --fix-broken install
sudo apt clean && sudo apt autoremove -y

mkdir ~/.vnc &> /dev/null

echo '#!/bin/bash
export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
taskset -c 4-7 startxfce4' > ~/.vnc/xstartup

echo 'vncserver -name remote-desktop -geometry 1280x720 -localhost no :1' > /usr/local/bin/vnc-start
echo 'vncserver -kill :1' > /usr/local/bin/vnc-stop

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vnc-start
chmod +x /usr/local/bin/vnc-stop

# echo "export DISPLAY=:1
# export PULSE_SERVER=127.0.0.1" >> ~/.bash_profile
# source ~/.bash_profile
