#!/bin/bash
mount --types proc /proc /mnt/ubuntu/proc
mount --rbind /sys /mnt/ubuntu/sys
mount --make-rslave /mnt/ubuntu/sys
mount --rbind /dev /mnt/ubuntu/dev
mount --make-rslave /mnt/ubuntu/dev 

chroot /mnt/ubuntu /bin/bash
# source /etc/profile
# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
