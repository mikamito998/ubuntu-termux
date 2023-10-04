yes | pkg install x11-repo 
yes | pkg install virglrenderer-android
echo 'alias gl="MESA_NO_ERROR=1 MESA_GL_VERSION_OVERRIDE=4.3COMPAT MESA_GLES_VERSION_OVERRIDE=3.2 virgl_test_server_android &"' >> ~/.bashrc
source ~/.bashrc
clear
