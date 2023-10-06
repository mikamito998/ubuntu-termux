# Easy Install Ubuntu, VirGL, Login

# Ubuntu
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/distro/ubuntu.sh; chmod +x ubuntu.sh; ./ubuntu.sh; rm ubuntu.sh;

# VirGL ES
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/virgl.sh; chmod +x virgl.sh; ./virgl.sh; rm virgl.sh;

# Login
#echo "proot-distro login ubuntu" >> $PREFIX/bin/root && chmod +x $PREFIX/bin/root
#echo "proot-distro login --user ubuntu ubuntu" >> $PREFIX/bin/user && chmod +x $PREFIX/bin/user

clear
echo "Installation has been completed"
proot-distro login ubuntu
