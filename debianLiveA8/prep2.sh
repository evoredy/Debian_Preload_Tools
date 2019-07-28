#!/bin/bash


## Chroot prep script (this is run on the build system)
## Change the hostname of the system

echo "TieAdvanced-USB" > /etc/hostname

## Install Packages

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
    debootstrap squashfs-tools mtools gpsd \

## Set root password, create other user

echo root:Password123 | /usr/sbin/chpasswd
useradd -s /bin/bash pilot
echo pilot:Password123 | /usr/sbin/chpasswd
mkhomedir_helper pilot
echo 'pilot  ALL=(ALL:ALL) ALL' >> /etc/sudoers

exit
