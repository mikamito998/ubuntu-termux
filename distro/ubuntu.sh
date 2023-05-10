echo "allow-external-apps = true" >> ~/.termux/termux.properties
echo "hide-soft-keyboard-on-startup = true" >> ~/.termux/termux.properties
pkg clean && termux-setup-storage && yes | pkg update && pkg install nano wget proot-distro pulseaudio -y && pkg clean &&
proot-distro install ubuntu && proot-distro clear-cache &&
echo 'pulseaudio --kill --start --exit-idle-time=-1 --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1"    
alias start="proot-distro login ubuntu --shared-tmp --no-sysvipc"' > ~/.bashrc &&
termux-reload-settings && source ~/.bashrc

# Install VirGL ES
pkg install x11-repo 
pkg install virglrenderer-android

echo 'alias gl="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 virgl_test_server_android &"' >> /data/data/com.termux/files/home/.bashrc
echo 'alias gl="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_EXTENSION_OVERRIDE=GL_EXT_polygon_offset_clamp GALLIUM_DRIVER=virpipe WINEDEBUG=-all"' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/.bashrc
source ~/.bashrc

proot-distro login ubuntu

# Instal VirGL Zink
#pkg install x11-repo tur-repo
#pkg install mesa-zink virglrenderer-mesa-zink
#echo 'alias zink="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 GALLIUM_DRIVER=zink ZINK_DESCRIPTORS=lazy virgl_test_server --use-egl-surfaceless --use-gles &"' >> /data/data/com.termux/files/home/.bashrc
#echo 'alias zink="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_EXTENSION_OVERRIDE=GL_EXT_polygon_offset_clamp GALLIUM_DRIVER=virpipe WINEDEBUG=-all"' >> /data/data/com.termux/files/usr/var/lib/proot-distro/installed-rootfs/ubuntu/root/.bashrc
#source ~/.bashrc
