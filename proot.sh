#XFCE
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/desktop/xfce.sh; chmod +x xfce.sh; ./xfce.sh; rm xfce.sh

#Chromium
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/chrome.sh; chmod +x chrome.sh; ./chrome.sh; rm chrome.sh

#Box86_64 & Wine Stable
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box86_64.sh; chmod +x box86_64.sh; ./box86_64.sh; rm box86_64.sh

#Box86_64 & Wine Development
#wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box64.sh; chmod +x box64.sh; ./box64.sh; rm box64.sh

#Box64_wow64 & Wine
#wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box64_wow64.sh; chmod +x box64_wow64.sh; ./box64_wow64.sh; rm box64_wow64.sh

#Box64 Wine64
#wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box_wine.sh; chmod +x box_wine.sh; ./box_wine.sh; rm box_wine.sh

#LibreOffice
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/libreoffice.sh; chmod +x libreoffice.sh; ./libreoffice.sh; rm libreoffice.sh

#Firefox
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/firefoxxx.sh; chmod +x firefoxxx.sh; ./firefoxxx.sh; rm firefoxxx.sh

#User
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/desktop/user.sh; chmod +x user.sh; ./user.sh; rm user.sh

#MacOS Theme
#wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/theme/whitesur.sh; chmod +x whitesur.sh; ./whitesur.sh; rm whitesur.sh

#Clean
#wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/clean.sh; chmod +x clean.sh; ./clean.sh; rm clean.sh

# Clean and Fix
#apt --fix-broken install && apt update --fix-missing
#apt clean && apt autoclean && apt autoremove -y
#apt install -f
#dpkg --configure -a
#apt update && apt upgrade -y

clear
echo "Installation has been completed."
echo "Please restart the termux."
