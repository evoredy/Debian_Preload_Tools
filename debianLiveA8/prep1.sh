#!/bin/bash

## Prep the host system with needed packages. these take space 

sudo apt-get -y --allow-unauthenticated install \
    debootstrap \
    squashfs-tools \
    grub-pc-bin \
    grub-efi-amd64-bin \
    mtools

## Create the directory where contents will be added

mkdir $HOME/LIVE_BOOT

## Bootstrap the directory with arch and flavor

sudo debootstrap \
    --arch=amd64 \
    --variant=minbase \
    stretch \
    $HOME/LIVE_BOOT/chroot \
    http://ftp.us.debian.org/debian/

## Copy the script that will run in the chroot enviro 

sudo cp prep2.sh $HOME/LIVE_BOOT/chroot/

## Run that script under chroot

sudo chroot $HOME/LIVE_BOOT/chroot ./prep2.sh
