+++
title = "Artix Linux Installation"
date = "2021-02-14"
tags = ["Technical"]
cover = "https://i.redd.it/4gy5n9xr9dh61.png"
categories = ["Technical"]
description = "My Artix linux installation process with detailed notes. Image is simply comprised on neofetch commands from both my pc and android phone. The rest is edited in gimp. Snapmod went into it, several screenshots just stitched together. I used the multiply layer mode style alot to truly get those greens out. "
+++

# Why?

 Not long ago, my knowledge of operating systems was limited. I only thought that Windows and MacOS were the only operating systems in existence,but little did i know that
there was another universe out there. A universe packed with real freedom,better security, extreme customizability, faster and filled with an even larger community,
than my brain could ever comprehend. I remember the feeling of excitement that ran across my face, when i first installed a linux distribution on my personal computer. I ws finally able to depart from the world of claustrophobia inducing _windows_ and genetically modified _apples_, for a penguin? I was finally breathing the same air as the Xenial
Xerus (Ubuntu 16.04 LTS). From that point onwards, i would participate in the treacherous act of distro hopping. I experienced just about 
every linux distribution listed in the [distrowatch](https://distrowatch.com/) top 30 ranking at that time. I tasted various desktop environment flavors in search of more experiences and something tastier. I didn't exactly know what i wanted, but trying new things was just pure fun.
I encountered a wide variety of issues along the way, but the answers were only a simple search away. My displeasure for linux distributions gradually progressed and boiled down to confusion, which later turned to concern.
Every linux distribution i tried came preinstalled and preconfigured with loads of packages. I wondered to myself, "is there a linux distirbution out there that's minimal?" One question led to another and 
eventually i was reading about Arch linux. Arch linux was the answer that i had been looking for all this time, but the installation process was daunting. I feared that things could go wrong during the installation process, rendering my computer useless and being forced to buy a new computer. I never tried it, but the Arch linux principle of simplicity stuck with me. The Arch Linux wiki defines simplicity as _without unnecessary additions and modifications_ . The closest thing to Arch linux without the daunting installation process was Manjaro, a distribution that i had never tried before. Instead of trying the official editions of Manjaro, i decided to try the community editions. I did try all the community editions, but the one that truly captured my heart was the manjaro awesome edition. It was the fastest out of all the other community editions, at least with my hardware. One thing i noticed right off the bat was that almost all the community editions were bloated wth XFCE packages. At that point, i was contemplating on whether i should switch to Arch linux or proceed with the last Manjaro version i would try, Manjaro Architect. This time i wanted something that i could customize from the ground up. If its installed on my computer, it's because i put it there (simplicity). Upon searching for Arch linux based distros on duckduckgo, i stumbled upon one that had interesting wording, Artix Linux. Simple, fast and systemd free. The first keywords got me hooked in, but i was curious about this thing called Systemd. I did not find anything positive on the subject of Systemd. Almost every article that i read online despised this entity known as Systemd. The Arch linux wiki was neutral, as it simply stated what it is and nothing more.  Why do people hate systemd? Turns out every distribution i encountered had systemd. What's so special, about not having systemd? The only way to find out was to give it a try. I was scared to install Artix linux, but i knew that i had to try it. To ease my fear, i decided to look up an installation video on YouTube. To my surprise the Artix Linux installation videos were much shorter than that of Arch linux. I decided to takes notes during the process, so that if i messed up, i could know what i did wrong. With that long introduction, lets get to the fun part of how i installed Artix Linux. This guide will go over the same information that is available in the official installation wiki.

### Installation (DRAFT)

- Detailed Notes required

User:root
Password:artix

> Unblock WiFi
<span style='color:#a8ff17;'>

`rfkill unblock wifi`

</span>

> Wlan0  - WiFi card/adapter. Eth0  - Ethernet. Setup wlan0

`ip link set wlan0 up`

> WiFi utility

`connmanctl`

> Scan networks

`scan wifi`

 See list of connections

`services`

> Turn on agent

`agent on`

> Connect to network

`connect wifi_x_x_managed_psk`

> Exit WiFi utility

`quit`

> Check connection. Ctrl + C to exit ping.

`ping website` or `ip a`


> Check the disk

`lsblk`

> Partition the disk

`cfdisk /dev/sda`

> Press delete key until you see free space

`new` > `500M` > `type=EFI System` > `write` > `yes`

`new` > `enter` > `type=Linux Filesystem` > `write` > `yes` > `quit`

>  Make a fat partition on the EFI System

`mkfs.fat -F32 /dev/sda1`

> Make an Ext4 partition on Linux filesytem

`mkfs.ext4 /dev/sda2`

> Check partitions again

`lsblk`

> Mount root partition

`mount /dev/sda2  /mnt`

> Make an EFI boot directory in the root partition

`mkdir -p /mnt/boot/efi`

> Mount boot partition onto the EFI system

`mount /dev/sda1  /mnt/boot/efi`

> Check to see the mounted partitions

`lsblk`

> Install the base system

`basestrap  /mnt  linux linux-firmware base base-devel runit elogind-runit intel-ucode nano`

> Fstab

`fstabgen -U /mnt >> /mnt/etc/fstab`

> Check the fstab

`cat /mnt/etc/fstab`

> Move from the installer into the iso

`artix-chroot  /mnt`

> For a more interactive experience, switch the shell

`bash`

> Create a swap file

`dd if=/dev/zero of=/swapfile  bs=1G count=2 status=progress`

> Change the permissions of the swap file

`chmod 600 /swapfile`

> Make the swap partition

`mkswap /swapfile`

> Mount the swap partition

`swapon /dev/swapfile`

> Add the swap partition into the fstab

`nano /etc/fstab`

/swapfile     none   swap   defaults   0  0

> Change the time

`ln -sf /usr/share/zoneinfo/America/Chicago  /etc/localtime`

> Sync system clock with your hardware

`hwclock  --systohc`

> Select your locale

`nano /etc/locale.gen`

> Uncomment

`en_US.UTF-8  UTF-8`

> Generate your locale

`locale -gen`

> Add the locale to the configuration

`nano /etc/locale.conf`

`LANG=en_US. UTF-8`

> Create a hostname

`nano /etc/hostname`

`artix`

> Create a hosts file

`nano /etc/hosts`

127.0.0.1     localhost
::1                  localhost
127.0.1.1      artix.localdomain   artix

> Change the root password

`passwd`

> Install grub & other packages

`pacman -S grub efibootmgr networkmanager networkmanager-runit network-manager-applet dosfstools linux-headers xdg-utils xdg-user-dirs`

> Grub install

`grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=grub `

> Configure grub

`grub-mkconfig -o /boot/grub/grub.cfg`

> Add a user

`useradd -m user`

> Add password for user

`passwd user`

> Change the sudoers  file

`EDITOR=nano visudo`


> Exit the chroot environment

`exit` & `exit`

> Unmount  system

`umount -R /mnt `

> Reboot system & Remove installation media

`reboot`

![img](https://distrowatch.com/images/other/periodic-table-of-distro.png)

<!-- The Bitwarden Exile: I once sailed across the atlantic in search of a peace of mind and a notebook that would securely store the passwords of digital existece. My eyes feasted upon the glorius password manager known as Bitwarden, but little did i know, i would soon lose myself. I was consumed by the technology that i believed would save my life and the pending monetary deduction of the subscription it was only moments away. The management part of it excels, but why is 2 factor authentication not free? So i moved away... -->
