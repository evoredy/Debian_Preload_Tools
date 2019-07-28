# Welcome to a Debian Stretch Live USB Creator v0.0.3a

In order to test and iterate on industrial hardware FAST, these scripts allow a developer to quickly make a bootable Debian Linux environment on removable media without worrying about partitioning, BIOS compatibility, preseeding, etc. Also, it includes an SSH daemon to accept connections to allow easy testing/connectivity to headless systems. Live CD/DVD/USB distributions don't allow easy package modification nor do they come with server daemons (like ssh). Examining the scripts allows the thought-process to get Linux up and running with minimal packages short of compiling the kernel and dependencies. This has some very useful tools for stress-testing a single-board computer (for example). All packages are sourced from mainline repositorites. See (https://www.debian.org/)

After installed, the system will be bootable with the below utilities and services along with an SSH daemon which can be accessesed via network. User is [pilot].

Works on most all x64 hardware that supports booting from block devices. Make sure to update your password. 

Hardware Requirements:
  * [AMD64 compatible system]
  * [>512MB Memory Recommended]
  * [>4GB Removable Media]
  * [>4GB Workspace]
  * [Internet Connection or Mirrored Repositories]


The host system will have these packages added
  * [debootstrap]
  * [squashfs-tools]
  * [grub-pc-bin]
  * [grub-efi-amd64-bin]
  * [mtools]

The live Debian environment will have these packages installed (these can be adjusted by modifying ```prep2.sh``` line 16).
  * [linux-image-amd64]
  * [live-boot]
  * [systemd-sysv]
  * [locales]
  * [network-manager] 
  * [net-tools]
  * [curl] 
  * [openssh-client] 
  * [openssh-server]
  * [blackbox] 
  * [xserver-xorg-core] 
  * [xserver-xorg] 
  * [xinit] 
  * [xterm] 
  * [vim] 
  * [nano] 
  * [sudo] 
  * [dosfstools] 
  * [parted] 
  * [gdisk]
  * [screen] 
  * [libuhd-dev]
  * [sysbench]
  * [i7z]
  * [thermald]
  * [linux-cpupower]
  * [cpulimit]
  * [alsa-utils]
  * [alsa-tools]
  * [htop]
  * [powertop]
  * [grub-pc-bin] 
  * [grub-efi-amd64-bin] 
  * [grub2-common]
  * [debootstrap] 
  * [squashfs-tools]
  * [mtools]
  * [gpsd]

## Getting started

Ensure you have an internet connection or connection to mirrored Debian Stretch repositiories. Also, you will need a USB drive or other removable media tied to:
```
/dev/sda  

```
Partition tables will be modified on that device so use something that is empty or has expendable data.

Finally, ensure you have root privilages and over 1GB of free space.

## Running the Scripts

You should have four scripts: [prep1.sh], [prep2.sh], [final.sh], [mkusb.sh]  

Make sure the USB or media device is plugged in, mounted and identified as ```/dev/sda```. Leave the device mounted and dismount any partitions. You can see a list of mounted devices by using ```lsblk``` or ```blkid```.

Type:
```
sudo ./prep1.sh

sudo ./final.sh

sudo ./mkusb.sh
```

If there were no reported errors, your media device will have three partitions (one for MBR compatibility [hidden], a UEFI partition, and a Linux partition). The USB device should be bootable and can be verified. Feel free to use bits and pieces of the scripts if there was a stopping-point in your media creation process or to pre-load production systems.   

## Changelog v0.0.3a
```
  - added gpsd
```

## Changelog v0.0.1a
```
	- Initial Release
```

## Known Issues
```
	- hard-coded media device
	- hard-coded users/passwords
	- multiple scripts
	- no internal tests
	- elementary readme 
	- library version locking (if required)
  - untested on x86 architecture or i486 (like Intel Galileos)
  - need to add x86 (legacy) support
```
