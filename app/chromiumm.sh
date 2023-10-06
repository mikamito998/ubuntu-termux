sudo apt update && apt upgrade -y
sudo apt install apt-utils gnupg gnupg1 gnupg2 software-properties-common --no-install-recommends -y

echo -e "deb http://ftp.debian.org/debian buster main\ndeb http://ftp.debian.org/debian buster-updates main" >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32

sudo apt update && apt upgrade -y
apt install chromium -y
sed -i 's/chromium %U/chromium --no-sandbox %U/g' /usr/share/applications/chromium.desktop
