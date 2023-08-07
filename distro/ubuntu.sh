echo "allow-external-apps = true" >> ~/.termux/termux.properties && echo "hide-soft-keyboard-on-startup = true" >> ~/.termux/termux.properties
pkg clean && termux-setup-storage && yes | pkg update && pkg install nano wget proot-distro pulseaudio -y && pkg clean && proot-distro install ubuntu && proot-distro clear-cache &&
echo 'pulseaudio --verbose --start --exit-idle-time=-1 --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1"
alias start="proot-distro login ubuntu --shared-tmp --no-sysvipc"' >> ~/.bashrc && . ~/.bashrc && termux-reload-settings
