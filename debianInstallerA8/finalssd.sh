#!/bin/bash

## this directory will house the complete package with bootloader, kernel, and rootfs.
sudo cpupower frequency-set -u 2.7GHz

sudo mkdir -p /mnt/ssd/build/PRE_INST/{scratch,image/live}

sudo mksquashfs \
    /mnt/ssd/build/PRE_INST/chroot \
    /mnt/ssd/build/PRE_INST/image/live/filesystem.squashfs \
    -e boot

sudo unsquashfs -f -d /mnt/ssd/ \
    /mnt/ssd/build/PRE_INST/image/live/filesystem.squashfs

sudo cat <<'EOF' >/mnt/ssd/build/PRE_INST/scratch/grub.cfg

search --set=root --file /TIE_FIGHTER

insmod all_video

set default="0"
set timeout=3

menuentry "Debian Metal (TieA8)" {
    linux /vmlinuz root=/dev/sda3 rw quiet nomodeset
    initrd /initrd.img
}
EOF

sudo touch /mnt/ssd/build/PRE_INST/image/TIE_FIGHTER

sudo cp -r /mnt/ssd/build/PRE_INST/image/* /mnt/ssd/

sudo cp \
    /mnt/ssd/build/PRE_INST/scratch/grub.cfg \
    /mnt/ssd/boot/grub/grub.cfg

##clean dangling symlinks

# sudo rm /mnt/ssd/initrd.img
# sudo rm /mnt/ssd/initrd.img.old
# sudo rm /mnt/ssd/vmlinuz
# sudo rm /mnt/ssd/vmlinuz.old

#clean prep script
sudo rm /mnt/ssd/prepssd2.sh

#copy kernel and initial ram drive to boot

sudo cp /mnt/ssd/build/PRE_INST/chroot/boot/vmlinuz-* \
        /mnt/ssd/boot/ && \
sudo cp /mnt/ssd/build/PRE_INST/chroot/boot/initrd.img-* \
        /mnt/ssd/boot/ 

sudo umount /mnt/{ssd,efi}