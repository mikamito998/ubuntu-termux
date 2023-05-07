#Install proot-distro
echo "allow-external-apps = true" >> ~/.termux/termux.properties
echo "hide-soft-keyboard-on-startup = true" >> ~/.termux/termux.properties
pkg clean && termux-setup-storage && yes | pkg update && pkg install nano wget proot-distro pulseaudio -y && pkg clean && proot-distro install ubuntu && proot-distro clear-cache && echo 'pulseaudio --kill --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1   
alias start="proot-distro login ubuntu --shared-tmp --no-sysvipc"' > ~/.bashrc &&
termux-reload-settings && source ~/.bashrc

#Simple login for root, just type: root
echo "proot-distro login ubuntu" >> $PREFIX/bin/root && chmod +x $PREFIX/bin/root

#Simple login for user, just type: ubuntu
echo "proot-distro login --user ubuntu ubuntu" >> $PREFIX/bin/ubuntu && chmod +x $PREFIX/bin/ubuntu
