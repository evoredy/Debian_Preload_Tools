# Welcome to a Debian Stretch Installer v0.0.9a

Debian Stretch Headless Installer

This installer script, when used in conjunction with debianLive output will fully provision an x64 based system with packages in the below list. A live-boot environment is created on the target platform, legacy BIOS and UEFI compatibility are maintained and remaining harddrive space (partition 4) is configured for user data space. This is to aid in building a production environment with minimal to no user-intervention.

After installed, the system will be bootable with the below utilities and services along with an SSH daemon which can be accessesed via network. User is [pilot].

Works on most all x64 hardware that supports booting from block devices. Make sure to update your password.  

The Debian environment will have these packages installed
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
  * [avrdude]
  * [monit]
  * [runit]

## Getting started

Ensure you have an internet connection or connection to mirrored Debian Stretch repositiories and you are booted with a functioning debianLive build from this repository. The block device that will be overwritten is below: 
```
/dev/sda  
```
Partition tables will be modified on that device so verify there is nothing important on that drive.

Finally, ensure you have root privilages.

## Running the Scripts

Type:
```
sudo ./mkssd.sh

sudo ./prepssd1.sh

sudo ./finalssd2.sh
```

If there were no reported errors, your hard drive will have four partitions (one for MBR compatibility [hidden], a UEFI partition, a Linux Live partition, and a Data Partition). The hard drive should be bootable. Feel free to use bits and pieces of the scripts if there was a stopping-point in your media creation process or to pre-load production systems.

## Changelog v0.0.9a
```
  - added: 
    [avrdude monit runit]
```

## Changelog v0.0.7a
```
  - added: 
    [git gcc make cmake g++ cryptsetup python-mako libboost-all-dev swig pkg-config
    libavfilter-dev ffmpeg libzmq3-dev sphinx-common libqwt5-qt4-dev libqwt5-qt4 libqwt5-doc
    libcomedi-dev doxygen libsdl-stretch-dev gpsd]
```

## Changelog v0.0.5a
```
  - increased rootfs partition to 23.6GB
```

## Changelog v0.0.3a
```
  - PERSISTANCE!
  - filesystem is r/w automatically
  - fixed kernel and initial ramdrive linkings
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
