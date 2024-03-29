# Ubuntu
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/distro/ubuntu.sh; chmod +x ubuntu.sh; ./ubuntu.sh; rm ubuntu.sh;

# VirGL ES
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/virgl.sh; chmod +x virgl.sh; ./virgl.sh; rm virgl.sh;

# Login
echo "proot-distro login ubuntu" >> $PREFIX/bin/root && chmod +x $PREFIX/bin/root
echo "proot-distro login --user ade ubuntu" >> $PREFIX/bin/user && chmod +x $PREFIX/bin/user

# Clean and Fix
apt --fix-broken install && apt update --fix-missing
pkg clean && pkg autoremove -y
pkg install -f
dpkg --configure -a
pkg update && pkg upgrade -y

clear
echo "Installation has been completed"
