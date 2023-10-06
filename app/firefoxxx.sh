#!/bin/bash

sudo apt update && apt upgrade -y
sudo apt install -y apt-utils gnupg gnupg1 gnupg2 --no-install-recommends --no-install-suggests #software-properties-common

PREFFILE="/etc/apt/preferences.d/mozilla-firefox"

print_key() {
    cat <<-EOF
-----BEGIN PGP PUBLIC KEY BLOCK-----
Comment: Hostname: 
Version: Hockeypuck 2.1.0-189-g15ebf24

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
o5I=
=T8PE
-----END PGP PUBLIC KEY BLOCK-----
EOF
}

echo "deb https://ppa.launchpadcontent.net/mozillateam/ppa/ubuntu jammy main" | tee /etc/apt/sources.list.d/mozillateam-ubuntu-ppa-jammy.list

print_key | gpg --dearmor > /etc/apt/trusted.gpg.d/firefox.gpg 2> /dev/null

if [ ! -f $PREFFILE ]; then
    mkdir -p /etc/apt/preferences.d/
    cat > $PREFFILE <<EOF
Package: *
Pin: release o=LP-PPA-mozillateam
Pin-Priority: 1001
EOF
    fi

echo 'Unattended-Upgrade::Allowed-Origins:: "LP-PPA-mozillateam:${distro_codename}";' | tee /etc/apt/apt.conf.d/51unattended-upgrades-firefox

sudo apt update && apt upgrade -y
sudo apt install -y firefox-esr --no-install-recommends --no-install-suggests

sudo apt clean && apt autoremove -y
sudo apt --fix-broken install && apt update --fix-missing
sudo apt install -f
sudo dpkg --configure -a
sudo apt update && apt upgrade -y
