#!/bin/bash
mount --types proc /proc /mnt/alpine/proc
mount --rbind /sys /mnt/alpine/sys
mount --make-rslave /mnt/alpine/sys
mount --rbind /dev /mnt/alpine/dev
mount --make-rslave /mnt/alpine/dev 

chroot /mnt/alpine /bin/sh
# source /etc/profile
# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
