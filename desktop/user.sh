clear
echo "====================================="
echo ""
echo "Please create a password for Root..."
passwd
echo "The password for Root has been set..."
echo ""
echo "====================================="
echo ""
echo "Please create a password for User..."
adduser ade
echo "ade ALL=(ALL:ALL) ALL" >> /etc/sudoers
usermod -aG sudo ade
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
