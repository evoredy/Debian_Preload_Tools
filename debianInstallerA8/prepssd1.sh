#!/bin/bash

## Prep the host system with needed packages. these take space 
## These are on the live Debian USB

# sudo apt-get -y --allow-unauthenticated install \
#     debootstrap \
#     squashfs-tools \
#     grub-pc-bin \
#     grub-efi-amd64-bin \
#     mtools

## Create the directory where contents will be added

sudo mkdir /mnt/ssd/build/PRE_INST

## Bootstrap the directory with arch and flavor

sudo debootstrap \
    --arch=amd64 \
    --variant=minbase \
    stretch \
    /mnt/ssd/build/PRE_INST/chroot \
    http://ftp.us.debian.org/debian/

## Copy the script that will run in the chroot enviro 

sudo cp prepssd2.sh /mnt/ssd/build/PRE_INST/chroot/

## Run that script under chroot

sudo chroot /mnt/ssd/build/PRE_INST/chroot ./prepssd2.sh