#!/bin/bash

## this directory will house the complete package with bootloader, kernel, and rootfs.
sudo mkdir -p $HOME/LIVE_BOOT/{scratch,image/live}

sudo mksquashfs \
    $HOME/LIVE_BOOT/chroot \
    $HOME/LIVE_BOOT/image/live/filesystem.squashfs \
    -e boot

sudo cp $HOME/LIVE_BOOT/chroot/boot/vmlinuz-* \
        $HOME/LIVE_BOOT/image/vmlinuz && \
sudo cp $HOME/LIVE_BOOT/chroot/boot/initrd.img-* \
        $HOME/LIVE_BOOT/image/initrd

sudo cat <<'EOF' >$HOME/LIVE_BOOT/scratch/grub.cfg

search --set=root --file /DEBIAN_CUSTOM

insmod all_video

set default="0"
set timeout=3

menuentry "Debian Live (TieA8)" {
    linux /vmlinuz boot=live quiet nomodeset
    initrd /initrd
}
EOF

sudo touch $HOME/LIVE_BOOT/image/DEBIAN_CUSTOM
