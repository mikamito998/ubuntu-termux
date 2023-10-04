## Ubuntu on Termux
- [x] Latest Stable Ubuntu
- [x] Lightweight XFCE Desktop
- [x] VNC HD
- [x] Audio Support
- [x] Firefox Browser
- [x] Chromium Browser
- [x] Libre Office
- [x] Other Apps
- [x] MacOS Theme
- [x] User & Root Login
- [x] Easy Install

## Auto Installation
### 1. Inside Termux
```
yes | pkg update; pkg upgrade -y; pkg install wget -y; wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/termux.sh; chmod +x termux.sh; ./termux.sh; rm termux.sh
```
### 2. Inside Ubuntu
```
apt update -y; apt upgrade -y; apt install wget -y; wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/proot.sh; chmod +x proot.sh; ./proot.sh; rm proot.sh
```
### Note:
- It contains: Install Latest Ubuntu, Install Lightweight Desktop XFCE, Install VNC HD, Install Box86, Install Box64, Install Wine, Install VirGL ES.
- If you want to install and configure manually, you can use the steps below.

## Manual installation
### 1. Install Ubuntu on Termux
```
yes | pkg update; pkg upgrade -y; pkg install wget -y; wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/distro/ubuntu.sh; chmod +x ubuntu.sh; ./ubuntu.sh; rm ubuntu.sh
```

### 2. Install Desktop XFCE on Ubuntu
```
apt update -y; apt upgrade -y; apt install wget -y; wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/desktop/xfce.sh; chmod +x xfce.sh; ./xfce.sh; rm xfce.sh
```

### 3. Add User, Add password for Root and User on Ubuntu (Manual)
#### Step 1. Inside Ubuntu
```
passwd
adduser yourusername
echo "yourusername ALL=(ALL:ALL) ALL" >> /etc/sudoers
usermod -aG sudo yourusername
```
#### Step 2. Inside Termux
```
echo "proot-distro login ubuntu" >> $PREFIX/bin/root && chmod +x $PREFIX/bin/root

echo "proot-distro login --user yourusername ubuntu" >> $PREFIX/bin/user && chmod +x $PREFIX/bin/user
```
#### Note:
- Please replace "yourusername" with the name you want.
- After the installation is done, you can login to proot-distro ubuntu from termux with this command: Login to Root = root and Login to User = user

### 4. Install Box86, Box64, and Wine on Ubuntu
- There are two versions of wine. Wine Stable and Wine Development. Please Choose only one:
#### 1. Wine 8.0.2 Stable
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box86_64.sh; chmod +x box86_64.sh; ./box86_64.sh; rm box86_64.sh
```
#### 2. Wine 8.17 Development
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/box64.sh; chmod +x box64.sh; ./box64.sh; rm box64.sh
```

### 5. Install VirGL ES on Termux
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/virgl.sh; chmod +x virgl.sh; ./virgl.sh; rm virgl.sh
```

### 6. Other Apps
<details>
<summary><code><b>Firefox</b></code></summary>
  
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/firefox.sh; chmod +x firefox.sh; ./firefox.sh; rm firefox.sh
```
</details>

<details>
<summary><code><b>Chromium</b></code></summary>
  
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/chromium.sh; chmod +x chromium.sh; ./chromium.sh; rm chromium.sh
```
</details>

<details>
<summary><code><b>LibreOffice</b></code></summary>
  
```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/libreoffice.sh; chmod +x libreoffice.sh; ./libreoffice.sh; rm libreoffice.sh
```
</details>

<details>
<summary><code><b>Blender</b></code></summary>

```
apt install blender
```
</details>

<details>
<summary><code><b>Gdebi Installer</b></code></summary>

```
apt install gdebi
```
</details>

<details>
<summary><code><b>Gedit</b></code></summary>

```
apt install gedit
```
</details>

<details>
<summary><code><b>Gimp</b></code></summary>

```
apt install gimp
```
</details>

<details>
<summary><code><b>Krita</b></code></summary>

```
apt install krita
```
</details>

<details>
<summary><code><b>Inkscape</b></code></summary>

```
apt install inkscape
```
</details>

<details>
<summary><code><b>OBS Studio</b></code></summary>

```
apt install obs-studio
```
</details>

<details>
<summary><code><b>Thunderbird</b></code></summary>

```
apt install thunderbird
```
</details>

<details>
<summary><code><b>VIM Editor</b></code></summary>

```
apt install vim
```
</details>

<details>
<summary><code><b>VS Code</b></code></summary>

```
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/app/vscode.sh; chmod +x vscode.sh; ./vscode.sh; rm vscode.sh
```
</details>

### 7. Customize Theme
- You can customize your own theme, or you can use MacOS Theme below.

### 8. Install MacOS Theme on Ubuntu (Configure Manually)
#### 1. Download the required files
```
yes | apt update; yes | apt upgrade; wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/theme/whitesur.sh; chmod +x whitesur.sh; ./whitesur.sh; rm whitesur.sh
```
#### 2. Customize Windows Manager Tweak (From here you need to customize MacOS Theme manually in VNC Viewer apps)
- (Cycling Tab) Uncheck Draw frame around selected windows while cycling,
- (Placement Tab) Slide to large until below M of "placement:",
- (Compositor Tab) Uncheck Show shadows under dock windows.
- CLOSE

#### 3. Customize Appearance
- (Style Tab) Select WhiteSur-Light,
- (Icons Tab) Select WhiteSur.
- CLOSE

#### 4. Customize Desktop Settings...
- (Background Tab) Select Folder "Other..." after that, Go to Home and click right on the blank, after that Check "Show Hidden Files", after that Open Folder "/.local/share/backgrounds" and then on the top panel Click "Open", and the last you can select any Wallpapers do you want.
- (Icons Tab) Change to (Icons orientation: Top Right Vertical) and click Arrange icons
- CLOSE

#### 5. Customize Mouse and Touchpad
- (Theme Tab) Select WhiteSur Cursors.
- CLOSE

#### 6. Customize Window Manager
- (Style Tab) Choose WhiteSur-Light Theme
- (Style Tab) Font Sans Bold, size 12
- (Style Tab) Button Layout Active, x [] - Tittle
- (Style Tab) Button Layout Hidden, o ∆ ↑
- CLOSE

#### 7. Customize Panel Preferences
- (Panel) Remove "Panel 2" and Select "Panel 1"
- (Items Tab) Open Applications Menu, Change icon with Apple Logo "start-here", after that Select "Use custom menu file:" and change the menu with Xpple Menu ".local/share/menu/xpple.menu" and close.
- (Items Tab) Add and Open AppMenu Plugin after that Check "Use bold applications name" and close
- (Items Tab) Open "Action Buttons", Change "Appearance:" to "Action Buttons". And Uncheck "Lockscreen, Switch User, Separator, Suspend, Shut Down"
- Items Tab) Remove "Workspace Switcher, Window Buttons"
- (Items Tab) Top to Bottom = Separator Transparent, Applications Menu, AppMenu Plugin, Separator Transparent, Separator, Status Tray Plugin, PulseAudio Plugin, Notification Plugin, Separator, Clock, Action Buttons
- (Appearance Tab) Turn off "Dark mode"
- (Appearance Tab) Fixed icon size 24
- CLOSE

#### 8. Customize Plank
```
plank --preferences
```
- (Appearance Tab) Change from (Theme: Default) to (Theme: theme-Light) If there is no "theme: theme-light" you need copy paste this command ```cp -r whitesur-gtk-theme/src/other/plank/theme-* .local/share/plank/themes/.``` and check again "plank -preferences"
- (Doclets) Add shortcut = "Desktop, Trash"
- CLOSE

#### 9. Customize Session and Startup
- (Application Autostart) Click add new autostart and fill (Name: Plank, Command: plank)
- CLOSE

#### 10. Customize Launchpad
##### Step 1.
- Open file manager and open folder ".local/share/applications"
- Add Launchpad.desktop to plank (seek)

##### Step 2. Change Launchpad.desktop
```
cd && cd .local/share/applications && nano Launchpad.desktop
```
##### Note for Step 2. (nano Launchpad.desktop) =
- lines number 3, Change to (Icon=~/.local/share/icons/WhiteSur/launchpad.svg)
- lines number 4, Change to (Exec=sh -c $HOME/.config/rofi/launchers/type-3/launcher.sh)
- SAVE and EXIT

#### 11. Customize Rofi
##### Step 1. Change launcher.sh
```
cd && cd .config/rofi/launchers/type-3 && nano launcher.sh
```
##### Note for Step 1. (nano launcher.sh) =
- lines number 14, Change to (theme='style-1')
- lines number 17, Create new line above "-show drun \" and write (-icon-theme WhiteSur \\)
- SAVE and EXIT

##### Step 2. Change style-1.rasi
```
cd && cd .config/rofi/launchers/type-3 && nano style-1.rasi
```
##### Note for Step 2. (nano style-1.rasi) =
- lines number 27 Main Window, Change to (fullscreen: true;)
- lines number 38, Change to (background-color: black / 80%;)
- lines number 59 Inputbar, Change to (margin: 0% 25%;)
- lines number 97 Listview, Change to (scrollbar: true;)
- SAVE and EXIT

#### 12. Customize Firefox Theme (Optional)
- Open Firefox app and then close it again
- Copy paste this command ```cd whitesur-gtk-theme && ./tweaks.sh -f```
- Close

##### All the code here is not purely from me, but I have summarized it from various sources. There is some code that I changed and fixed to make it install easily and run flawlessly.
##### Source: 
- https://github.com/vinceliuice
- https://github.com/adi1090x
- https://github.com/xDoge26
- Others
