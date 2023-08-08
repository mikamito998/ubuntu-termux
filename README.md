# Ubuntu on Termux
Setup Linux Proot on Android. It includes:
- [x] Latest Stable Ubuntu
- [x] Lightweight XFCE4 Desktop
- [x] VNC HD
- [x] Audio Support
- [x] Firefox Browser
- [x] Chromium Browser
- [x] Libre Office
- [x] MacOS Theme
- [x] User & SU Login
- [x] Easy Install

## 1. Ubuntu
```
yes | pkg update && pkg install wget -y && wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/distro/ubuntu.sh; chmod +x ubuntu.sh; ./ubuntu.sh; rm --force ubuntu.sh
```

## 2. XFCE
```
yes | apt update && apt install wget -y && wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/desktop/xfce.sh; chmod +x xfce.sh; ./xfce.sh; rm --force xfce.sh
```
### 2.1 User & SU
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/desktop/user.sh; chmod +x user.sh; ./user.sh; rm --force user.sh
```
#### Note 2.1 :
- Login root = proot-distro login ubuntu
- Login user = proot-distro login --user user ubuntu

## 3. Box86, Box64, and Wine
#### Box86, Box64, and Wine 8.0.2 Stable
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box86_64.sh; chmod +x box86_64.sh; ./box86_64.sh; rm --force box86_64.sh
```
#### Box64 and Wine 8.13 Development
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box64_wow64.sh; chmod +x box64_wow64.sh; ./box64_wow64.sh; rm --force box64_wow64.sh
```

## 4. Firefox
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/firefox.sh; chmod +x firefox.sh; ./firefox.sh; rm --force firefox.sh
```

## 5. Chromium
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/chromium.sh; chmod +x chromium.sh; ./chromium.sh; rm --force chromium.sh
```

## 6. Libre Office
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/libreoffice.sh; chmod +x libreoffice.sh; ./libreoffice.sh; rm --force libreoffice.sh
```

## 7. MacOS Theme
### 7.1 Download the required files
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/theme/whitesur.sh; chmod +x whitesur.sh; ./whitesur.sh; rm --force whitesur.sh
```
### 7.2 Customize Windows Manager Tweak (From here you need to customize MacOS Theme manually in VNC Viewer apps)
- (Cycling Tab) Uncheck Draw frame around selected windows while cycling,
- (Placement Tab) Slide to large until below M of "placement:",
- (Compositor Tab) Uncheck Show shadows under dock windows.
- CLOSE

### 7.3 Customize Appearance
- (Style Tab) Select WhiteSur-Light,
- (Icons Tab) Select WhiteSur.
- CLOSE

### 7.4 Customize Desktop Settings...
- (Background Tab) Select Folder "Other..." after that, Go to Home and click right on the blank, after that Check "Show Hidden Files", after that Open Folder "/.local/share/backgrounds" and then on the top panel Click "Open", and the last you can select any Wallpapers do you want.
- (Icons Tab) Change to (Icons orientation: Top Right Vertical) and click Arrange icons
- CLOSE

### 7.5 Customize Mouse and Touchpad
- (Theme Tab) Select WhiteSur Cursors.
- CLOSE

### 7.6 Customize Window Manager
- (Style Tab) Choose WhiteSur-Light Theme
- (Style Tab) Font Sans Bold, size 12
- (Style Tab) Button Layout Active, x [] - Tittle
- (Style Tab) Button Layout Hidden, o ∆ ↑
- CLOSE

### 7.7 Customize Panel Preferences
- (Panel) Remove "Panel 2" and Select "Panel 1"
- (Items Tab) Open Applications Menu, Change icon with Apple Logo "start-here", after that Select "Use custom menu file:" and change the menu with Xpple Menu ".local/share/menu/xpple.menu" and close.
- (Items Tab) Add and Open AppMenu Plugin after that Check "Use bold applications name" and close
- (Items Tab) Open "Action Buttons", Change "Appearance:" to "Action Buttons". And Uncheck "Lockscreen, Switch User, Separator, Suspend, Shut Down"
- Items Tab) Remove "Workspace Switcher, Window Buttons"
- (Items Tab) Top to Bottom = Separator Transparent, Applications Menu, AppMenu Plugin, Separator Transparent, Separator, Status Tray Plugin, PulseAudio Plugin, Notification Plugin, Separator, Clock, Action Buttons
- (Appearance Tab) Turn off "Dark mode"
- (Appearance Tab) Fixed icon size 24
- CLOSE

### 7.8 Customize Plank
```
plank --preferences
```
- (Appearance Tab) Change from (Theme: Default) to (Theme: theme-Light) If there is no "theme: theme-light" you need copy paste this command ```cp -r whitesur-gtk-theme/src/other/plank/theme-* .local/share/plank/themes/.``` and check again "plank -preferences"
- (Doclets) Add shortcut = "Desktop, Trash"
- CLOSE

### 7.9 Customize Session and Startup
- (Application Autostart) Click add new autostart and fill (Name: Plank, Command: plank)
- CLOSE

### 7.10 Customize Launchpad
#### Step 7.10.1
- Open file manager and open folder ".local/share/applications"
- Add Launchpad.desktop to plank (seek)

#### Step 7.10.2, Change Launchpad.desktop
```
cd && cd .local/share/applications && nano Launchpad.desktop
```
For nano Launchpad.desktop =
- lines number 3, Change to (Icon=~/.local/share/icons/WhiteSur/launchpad.svg)
- lines number 4, Change to (Exec=sh -c $HOME/.config/rofi/launchers/type-3/launcher.sh)
- SAVE and EXIT

### Step 7.11 Customize Rofi
#### Step 7.11.1, Change launcher.sh
```
cd && cd .config/rofi/launchers/type-3 && nano launcher.sh
```
For nano launcher.sh =
- lines number 14, Change to (theme='style-1')
- lines number 17, Create new line above "-show drun \" and write (-icon-theme WhiteSur \\)
- SAVE and EXIT

#### Step 7.11.2, Change style-1.rasi
```
cd && cd .config/rofi/launchers/type-3 && nano style-1.rasi
```
For nano style-1.rasi =
- lines number 27 Main Window, Change to (fullscreen: true;)
- lines number 38, Change to (background-color: black / 80%;)
- lines number 59 Inputbar, Change to (margin: 0% 25%;)
- lines number 97 Listview, Change to (scrollbar: true;)
- SAVE and EXIT

## Step 8. Customize Firefox Theme (Optional)
- Open Firefox app and then close it again
- Copy paste this command ```cd whitesur-gtk-theme && ./tweaks.sh -f```
- Close

## Step 9. Add User Manually (Optional)
#### Step 9.1 In Ubuntu
```
passwd
adduser yourusername
echo "yourusername ALL=(ALL:ALL) ALL" >> /etc/sudoers
usermod -aG sudo yourusername
```
#### Step 9.2 In Termux
```
echo "proot-distro login ubuntu" >> $PREFIX/bin/root && chmod +x $PREFIX/bin/root

echo "proot-distro login --user yourusername ubuntu" >> $PREFIX/bin/user && chmod +x $PREFIX/bin/user
```
#### Step 9.3 Done
- You can login user from termux to ubuntu just by typing yourusername.
- You can also login root from termux to ubuntu just by typing root, without typing proot-distro login ubuntu again.
- You can use "su" command and "su yourusername" command.
- Type command "groups yourusername" To check assign sudo privileges to a user.
- Note: Please change "yourusername" with name do you want.

## Step 10. Instant Install (Optional)
#### Step 10.1
```
yes | pkg update && apt install wget -y && pkg upgrade -y && wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/termux.sh; chmod +x termux.sh; ./termux.sh; rm --force termux.sh
```
#### Step 10.2
```
yes | apt update && apt install wget -y && wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/proot.sh; chmod +x proot.sh; ./proot.sh; rm --force proot.sh
```
- After install code from step 10.1 and step 10.2, You can start the next step from step 7.1 onwards

##### All the code here is not purely from me, but I have summarized it from various sources. There is some code that I changed and fixed to make it install easily and run flawlessly.
##### Source: 
- https://github.com/vinceliuice
- https://github.com/adi1090x
- https://github.com/xDoge26
- Others

