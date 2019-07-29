# Welcome to a Debian Stretch Installer Toolset

These utilities allow quick provisioning of hardware with Debian to allow FAST benchmarking, iteration, and product release. Think improved "preseed."

Take a look at what's happening. This will peel back what actually happens during an OS install using some simple tools and scripting. Also, I use this personally in my production hardware with very minor edits. It works great. Never needed to productize further. 

These scripts are VERY detailed and include everything from constructing a squashfs from scratch (using chroot and debootstrap for example) to partitioning the target media. Use with care as these are optimized to do work. 

What's Inside:
  * [debianLiveA8] - Live Debian USB creation scripts including partitioning
  * [debianInstallerA8] - Debian Installer (for permanent install) scripts
