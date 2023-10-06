sudo apt clean && apt autoremove -y
sudo apt --fix-broken install && apt update --fix-missing
sudo apt install -f
sudo dpkg --configure -a
sudo apt update && apt upgrade -y
