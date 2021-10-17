#!/bin/bash
mount --types proc /proc /mnt/ubuntu-mini/proc
mount --rbind /sys /mnt/ubuntu-mini/sys
mount --make-rslave /mnt/ubuntu-mini/sys
mount --rbind /dev /mnt/ubuntu-mini/dev
mount --make-rslave /mnt/ubuntu-mini/dev 

chroot /mnt/ubuntu-mini /bin/bash
# source /etc/profile
# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
