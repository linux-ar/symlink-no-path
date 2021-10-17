#!/bin/bash
mount --types proc /proc /mnt/void/proc
mount --rbind /sys /mnt/void/sys
mount --make-rslave /mnt/void/sys
mount --rbind /dev /mnt/void/dev
mount --make-rslave /mnt/void/dev 

chroot /mnt/void /bin/zsh
