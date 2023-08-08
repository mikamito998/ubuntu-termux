echo "Please create a password for root..."passwd
echo "The password for root has been set..."
echo "Now you can login to root using the 'su' command."
echo ""
echo "========="
echo ""
echo "Please create a password for user..."
adduser user
echo "user ALL=(ALL:ALL) ALL" >> /etc/sudoers
usermod -aG sudo user
echo "The password for user has been set..."
echo "Now you can login to user using the 'su user' command."
echo ""
