#One Click Install XFCE, User, Box86_64, Wine

yes | apt update && apt install wget -y

#XFCE
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/desktop/xfce.sh; chmod +x xfce.sh; ./xfce.sh; rm --force xfce.sh

#User
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/desktop/user.sh; chmod +x user.sh; ./user.sh; rm --force user.sh

#Box86_64 & Wine
wget https://raw.githubusercontent.com/mikamito998/Proot-Setup/main/box86_64.sh; chmod +x box86_64.sh; ./box86_64.sh; rm --force box86_64.sh

#Box64_wow64 & Wine
#wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box64_wow64.sh; chmod +x box64_wow64.sh; ./box64_wow64.sh; rm --force box64_wow64.sh
