#!/bin/bash


## Chroot prep script (this is run on the build system)
## Change the hostname of the system

echo "TieAdvanced-Metal" > /etc/hostname

## Update Repository Store

# mkdir /etc/apt

# printf "deb http://ftp.us.debian.org/debian stretch main contrib non-free\n
# deb-src http://ftp.us.debian.org/debian stretch main contrib non-free\n
# deb http://ftp.us.debian.org/debian stretch-updates main contrib non-free\n
# deb-src http://ftp.us.debian.org/debian stretch-updates main contrib non-free\n" > /etc/apt/sources.list

# ## Install Packages

# apt -y update

apt -y --allow-unauthenticated install \
    linux-image-amd64 \
    live-boot \
    systemd-sysv

apt -y --allow-unauthenticated install \
    locales network-manager net-tools man \
    curl openssh-client openssh-server \
    blackbox xserver-xorg-core xserver-xorg xinit xterm \
    vim nano sudo dosfstools parted gdisk screen \
    libuhd-dev \
    sysbench i7z thermald linux-cpupower cpulimit \
    alsa-utils alsa-tools \
    htop powertop \
    grub-pc-bin grub-efi-amd64-bin grub2-common \
    debootstrap squashfs-tools mtools \
    git gcc make cmake g++ cryptsetup python-mako libboost-all-dev swig pkg-config \
    libavfilter-dev ffmpeg libzmq3-dev sphinx-common libqwt5-qt4-dev libqwt5-qt4 libqwt5-doc \
    libcomedi-dev doxygen libsdl-stretch-dev gpsd avrdude \
    monit runit \

## Grab the UHD firmware images using the helper executable

uhd_images_downloader

## Set root password, create other user

echo root:Password123 | /usr/sbin/chpasswd
useradd -s /bin/bash pilot
echo piot:Password123 | /usr/sbin/chpasswd
mkhomedir_helper pilot
echo 'pilot  ALL=(ALL:ALL) ALL' >> /etc/sudoers

exit
