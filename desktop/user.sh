echo "====================================="
echo ""
echo "Please create a password for Root..."
passwd
echo "The password for Root has been set..."
echo ""
echo "====================================="
echo ""
echo "Please create a password for User..."
adduser user
echo "user ALL=(ALL:ALL) ALL" >> /etc/sudoers
usermod -aG sudo user
echo "The password for User has been set..."
echo ""
echo "====================================="
echo ""
echo "Please create a password for VNC Root..."
vnc-start
vnc-stop
echo "The password for VNC Root has ben set..."
echo ""
echo "====================================="
echo ""
su user
continue
echo "Pleass create a password for VNC User..."
vnc-start
vnc-stop
echo "The password for VNC User has been set..."
echo ""
echo "====================================="
