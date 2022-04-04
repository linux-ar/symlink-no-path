#!/bin/bash
mount --rbind /sys /mnt/arch/sys && mount --make-rslave /mnt/arch/sys
mount --rbind /dev /mnt/arch/dev && mount --make-rslave /mnt/arch/dev
mount --rbind /proc /mnt/arch/proc && mount --make-rslave /mnt/arch/proc
cat /etc/resolv.conf > /mnt/arch/etc/resolv.conf

chroot /mnt/arch /bin/fish
# source /etc/profile
# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
