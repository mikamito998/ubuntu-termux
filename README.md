# Ubuntu on Termux
Setup Linux Proot on Android. It includes:
- [x] Latest Stable Ubuntu
- [x] XFCE4 Desktop
- [x] VNC
- [x] Audio Support
- [x] Firefox Browser
- [x] Chromium Browser
- [x] Libre Office
- [x] MacOS Theme
- [x] User
- [x] One Click Install

## 1. Install Ubuntu
```
yes | pkg update && pkg install nano wget unzip git neofetch -y && wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/distro/ubuntu.sh; chmod +x ubuntu.sh; ./ubuntu.sh; rm --force ubuntu.sh
```

## 2. Install XFCE
```
yes | apt update && apt install sudo nano wget unzip git neofetch -y && wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/desktop/xfce.sh; chmod +x xfce.sh; ./xfce.sh; rm --force xfce.sh
```

## 3. Install box86_64 & Wine86_64
```
wget https://raw.githubusercontent.com/mikamito998/Proot-Setup/main/box86_64.sh; chmod +x box86_64.sh; ./box86_64.sh; rm --force box86_64.sh
```

## 4. Install Firefox
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/firefox.sh; chmod +x firefox.sh; ./firefox.sh; rm --force firefox.sh
```

## 5. Install Chromium
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/chromium.sh; chmod +x chromium.sh; ./chromium.sh; rm --force chromium.sh
```

## 6. Install Libre Office
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/libreoffice.sh; chmod +x libreoffice.sh; ./libreoffice.sh; rm --force libreoffice.sh
```

## 7. Install MacOS Theme
### 1. Download the required files
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/theme/whitesur.sh; chmod +x whitesur.sh; ./whitesur.sh; rm --force whitesur.sh
```
### 2. Customize Windows Manager Tweak (From here you need to customize MacOS Theme manually in VNC Viewer apps)
- (Cycling Tab) Uncheck Draw frame around selected windows while cycling,
- (Placement Tab) Slide to large until below M of "placement:",
- (Compositor Tab) Uncheck Show shadows under dock windows.
- CLOSE

### 3. Customize Appearance
- (Style Tab) Select WhiteSur-Light,
- (Icons Tab) Select WhiteSur.
- CLOSE

### 4. Customize Desktop Settings...
- (Background Tab) Select Folder "Other..." after that, Go to Home and click right on the blank, after that Check "Show Hidden Files", after that Open Folder "/.local/share/backgrounds" and then on the top panel Click "Open", and the last you can select any Wallpapers do you want.
- (Icons Tab) Change to (Icons orientation: Top Right Vertical) and click Arrange icons
- CLOSE

### 5. Customize Mouse and Touchpad
- (Theme Tab) Select WhiteSur Cursors.
- CLOSE

### 6. Customize Window Manager
- (Style Tab) Font Sans Bold, size 12
- (Style Tab) Button Layout Active, x [] - Tittle
- (Style Tab) Button Layout Hidden, o ∆ ↑
- CLOSE

### 7. Customize Panel Preferences
- (Panel) Remove "Panel 2" and Select "Panel 1"
- (Items Tab) Open Applications Menu, Change icon with Apple Logo "start-here", after that Select "Use custom menu file:" and change the menu with Xpple Menu ".local/share/menu/xpple.menu" and close.
- (Items Tab) Add and Open AppMenu Plugin after that Check "Use bold applications name" and close
- (Items Tab) Open "Action Buttons", Change "Appearance:" to "Action Buttons". And Uncheck "Lockscreen, Switch User, Separator, Suspend, Shut Down"
- Items Tab) Remove "Workspace Switcher, Window Buttons"
- (Items Tab) Top to Bottom = Separator Transparent, Applications Menu, AppMenu Plugin, Separator Transparent, Separator, Status Tray Plugin, PulseAudio Plugin, Notification Plugin, Separator, Clock, Action Buttons
- Appearance Tab) Turn off "Dark mode"
- (Appearance Tab) Fixed icon size 24
- CLOSE

### 8. Customize Plank
```
plank --preferences
```
- (Appearance Tab) Change from (Theme: Default) to (Theme: theme-Light)
- Doclets) Add shortcut = "Desktop, Trash"
- CLOSE

### 9. Customize Session and Startup
- (Application Autostart) Click add new autostart and fill (Name: Plank, Command: plank)
- CLOSE

### 10. Customize Launchpad
#### Step 1
- Open file manager and open folder ".local/share/applications"
- Add Launchpad.desktop to plank (seek)

#### Step 2, Change Launchpad.desktop
```
cd && cd .local/share/applications && nano Launchpad.desktop
```
For nano Launchpad.desktop =
- lines number 3, Change to (Icon=~/.local/share/icons/WhiteSur/launchpad.svg)
- lines number 4, Change to (Exec=sh -c /home/ade/.config/rofi/launchers/type-3/launcher.sh)
- SAVE and EXIT

### 11. Customize Rofi
#### Step 1, Change launcher.sh
```
cd && cd .config/rofi/launchers/type-3 && nano launcher.sh
```
For nano launcher.sh =
- lines number 14, Change to (theme='style-1')
- lines number 17, Create new line above "-show drun \" and write (-icon-theme WhiteSur \)
- SAVE and EXIT

#### Step 2, Change style-1.rasi
```
cd && cd .config/rofi/launchers/type-3 && nano style-1.rasi
```
For nano style-1.rasi =
- lines number 27 Main Window, Change to (fullscreen: true;)
- lines number 38, Change to (background-color: black / 80%;)
- lines number 59 Inputbar, Change to (margin: 0% 25%;)
- lines number 97 Listview, Change to (scrollbar: true;)
- SAVE and EXIT

## 8. Add User Manually
#### Step 1. In Ubuntu
```
adduser yourusername
su yourusername
echo "yourusername ALL=(ALL:ALL) ALL" >> /etc/sudoers
echo '#!/bin/bash
export DISPLAY=:1
export PULSE_SERVER=127.0.0.1
xrdb $HOME/.Xresources
taskset -c 4-7 startxfce4' > ~/.vnc/xstartup

echo 'vncserver -name remote-desktop -geometry 960x540 -localhost no :1' > /usr/local/bin/vnc-start
echo 'vncserver -kill :1' > /usr/local/bin/vnc-stop

chmod +x ~/.vnc/xstartup
chmod +x /usr/local/bin/vnc-start
chmod +x /usr/local/bin/vnc-stop
```
#### Step 2. In Termux
```
echo "proot-distro login --user yourusername ubuntu" >> $PREFIX/bin/yourusername && chmod +x $PREFIX/bin/yourusername
```
#### Step 3. Done
- You can login user from termux to ubuntu just by typing yourusername.
- You can also login root from termux to ubuntu just by typing root, without type proot-distro login ubuntu again, because it's to long.
- Note: Please change "yourusername" with name do you want

## 9. One Click Install
- If you are lazy to copy and paste the code above one by one, you can use this code after installing Ubuntu on Termux (After Step 1.)
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/oneclick.sh; chmod +x oneclick.sh; ./oneclick.sh; rm --force oneclick.sh
```
- After installing one click install code, go to step 8. Add User Manually or go directly to step 7.2 customize installed MacOS theme.

##### All the code here is not purely from me, but I have summarized it from various sources. There is some code that I changed and fixed to make it install easily and run flawlessly.
##### Source: 
- https://github.com/vinceliuice
- https://github.com/adi1090x
- https://github.com/xDoge26
- Others

