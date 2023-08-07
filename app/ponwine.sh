#PlayOnLinux Wine
PlayOnLinux X86 =

wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-x86/PlayOnLinux-wine-7.0-rc6-upstream-linux-x86.tar.gz
tar -xvf  PlayOnLinux-wine-7.0-rc6-upstream-linux-x86.tar.gz -C ~/wine/
echo "export BOX86_PATH=~/wine/bin/
export BOX86_LD_LIBRARY_PATH=~/wine/lib/
export BOX86_LOG=1" >> ~/.bashrc

wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-x86/PlayOnLinux-wine-4.0-rc7-upstream-linux-x86.tar.gz
tar -xvf PlayOnLinux-wine-4.0-rc7-upstream-linux-x86.tar.gz -C ~/wine/
echo "export BOX86_PATH=~/wine/bin/
export BOX86_LD_LIBRARY_PATH=~/wine/lib/
export BOX86_LOG=1" >> ~/.bashrc

wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-x86/PlayOnLinux-wine-7.9-upstream-linux-x86.tar.gz
tar -xvf PlayOnLinux-wine-7.9-upstream-linux-x86.tar.gz -C ~/wine/
echo "export BOX86_PATH=~/wine/bin/
export BOX86_LD_LIBRARY_PATH=~/wine/lib/
export BOX86_LOG=1" >> ~/.bashrc

PlayOnLinux x64=

wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-amd64/PlayOnLinux-wine-6.0-rc6-upstream-linux-amd64.tar.gz
tar -xvf PlayOnLinux-wine-6.0-rc6-upstream-linux-amd64.tar.gz -C ~/wine/
echo "export BOX64_PATH=~/wine/bin/
export BOX64_LD_LIBRARY_PATH=~/wine/lib/
export BOX64_LOG=1" >> ~/.bashrc

wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-amd64/PlayOnLinux-wine-4.0-rc7-upstream-linux-amd64.tar.gz
tar -xvf PlayOnLinux-wine-4.0-rc7-upstream-linux-amd64.tar.gz -C ~/wine/
echo "export BOX64_PATH=~/wine/bin/ export BOX64_LD_LIBRARY_PATH=~/wine/lib/ export BOX64_LOG=1" >> ~/.bashrc

wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-amd64/PlayOnLinux-wine-6.5-upstream-linux-amd64.tar.gz
tar -xvf PlayOnLinux-wine-6.5-upstream-linux-amd64.tar.gz -C ~/wine/
echo "export BOX64_PATH=~/wine/bin/ export BOX64_LD_LIBRARY_PATH=~/wine/lib/ export BOX64_LOG=1" >> ~/.bashrc
