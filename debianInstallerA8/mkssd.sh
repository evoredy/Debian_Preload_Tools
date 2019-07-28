#!/bin/bash

export disk=/dev/sda

sudo umount /dev/sda1
sudo umount /dev/sda2
sudo umount /dev/sda3
sudo umount /dev/sda4

sudo mkdir -p /mnt/{ssd,efi}

sudo parted --script $disk \
    mklabel gpt \
    mkpart primary fat32 2048s 4095s \
        name 1 BIOS \
        set 1 bios_grub on \
    mkpart ESP fat32 4096s 413695s \
        name 2 EFI \
        set 2 esp on \
    mkpart primary ext4 413696s 49979389s \
        name 3 LINUX \
    mkpart primary ext4 49979390s 100% \
        name 4 DATA_RW \

sudo gdisk $disk << EOF
r        # recovery and transformation options
h        # make hybrid MBR
1 2 3 4  # partition numbers for hybrid MBR
N        # do not place EFI GPT (0xEE) partition first in MBR
EF       # MBR hex code
N        # do not set bootable flag
EF       # MBR hex code
N        # do not set bootable flag
83       # MBR hex code
Y        # set the bootable flag
83       # MBR hex code
N        # do not set bootable flag
x        # extra functionality menu
h        # recompute CHS values in protective/hybrid MBR
w        # write table to disk and exit
Y        # confirm changes
EOF

sudo mkfs.vfat -F32 ${disk}2 && \
sudo mkfs.ext4 ${disk}3
sudo mkfs.ext4 ${disk}4

sudo mount ${disk}2 /mnt/efi && \
sudo mount ${disk}3 /mnt/ssd

sudo grub-install \
    --target=x86_64-efi \
    --efi-directory=/mnt/efi \
    --boot-directory=/mnt/ssd/boot \
    --removable \
    --recheck

sudo grub-install \
    --target=i386-pc \
    --boot-directory=/mnt/ssd/boot \
    --recheck \
    $disk

sudo mkdir -p /mnt/ssd/{boot/grub,ssd,build}