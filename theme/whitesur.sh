# Requirement
sudo apt install -y git gtk2-engines-murrine
sudo apt install -y xfce4-panel-profiles xfce4-appmenu-plugin
sudo apt install -y plank rofi

cd; git clone https://github.com/adi1090x/rofi

# Theme
cd; git clone https://github.com/vinceliuice/whitesur-gtk-theme; cd whitesur-gtk-theme; ./install.sh; cd;

# Icon
cd; git clone https://github.com/vinceliuice/whitesur-icon-theme; cd whitesur-icon-theme; ./install.sh; cd; cd /usr/local; cp -r /usr/share/icons $HOME/.local/share; cd;
 
# Cursor
cd; git clone https://github.com/vinceliuice/whitesur-cursors; cd whitesur-cursors; ./install.sh; cd; cp -r .local/share/icons/WhiteSur-cursors /usr/share/icons; cd;

# Wallpapers
cd; git clone https://github.com/vinceliuice/whitesur-wallpapers; cd whitesur-wallpapers; ./install-wallpapers.sh; cd;

# Xpple Menu
cd; wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/theme/plugin/xpple_menu.zip; unzip xpple_menu.zip; mv applications .local/share/.; mkdir -p .local/share/menu; mv xpple.menu .local/share/menu; cd;

# Plank
cd; cp -r whitesur-gtk-theme/src/other/plank/theme-* .local/share/plank/themes/.

# Launchpad
cd; wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/theme/icons/launchpad.svg; cp $HOME/launchpad.svg .local/share/icons/WhiteSur; cd;
cd; cd .local/share/applications; cat Launchpad.desktop; cd; cd .local/share/icons/WhiteSur; cp $HOME/launchpad.svg .; cd;

# Rofi
cd; cd rofi; ./setup.sh; cd; cd .config/rofi; rm config.rasi;

