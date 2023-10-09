#One Click Install XFCE, Box86_64, Wine, User

#XFCE
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/desktop/xfce.sh; chmod +x xfce.sh; ./xfce.sh; rm xfce.sh

#LibreOffice
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/libreoffice.sh; chmod +x libreoffice.sh; ./libreoffice.sh; rm libreoffice.sh

#Box86_64 & Wine Stable
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box86_64.sh; chmod +x box86_64.sh; ./box86_64.sh; rm box86_64.sh

#Box86_64 & Wine Development
#wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box64.sh; chmod +x box64.sh; ./box64.sh; rm box64.sh

#Box64_wow64 & Wine
#wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box64_wow64.sh; chmod +x box64_wow64.sh; ./box64_wow64.sh; rm box64_wow64.sh

#Firefox
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/firefoxxx.sh; chmod +x firefoxxx.sh; ./firefoxxx.sh; rm firefoxxx.sh

#Chromium
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/chromium.sh; chmod +x chromium.sh; ./chromium.sh; rm chromium.sh

#MacOS Theme
#wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/theme/whitesur.sh; chmod +x whitesur.sh; ./whitesur.sh; rm whitesur.sh

#User
#wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/desktop/user.sh; chmod +x user.sh; ./user.sh; rm user.sh

#Clean
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/clean.sh; chmod +x clean.sh; ./clean.sh; rm clean.sh

clear
echo "Installation has been completed."
echo "Please restart the termux."
