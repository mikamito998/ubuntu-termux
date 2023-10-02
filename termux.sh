# Easy Install Ubuntu, VirGL, Login

# Ubuntu
wget https://raw.githubusercontent.com/mikamito998/ubuntu-termux/main/distro/ubuntu.sh; chmod +x ubuntu.sh; ./ubuntu.sh; rm --force ubuntu.sh

# VirGL ES
yes | pkg install x11-repo 
yes | pkg install virglrenderer-android
echo 'alias gl="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 virgl_test_server_android &"' >> ~/.bashrc
source ~/.bashrc

# Login
echo "proot-distro login ubuntu" >> $PREFIX/bin/root && chmod +x $PREFIX/bin/root
echo "proot-distro login --user ubuntu ubuntu" >> $PREFIX/bin/user && chmod +x $PREFIX/bin/user
proot-distro login ubuntu
