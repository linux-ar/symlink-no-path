#!/bin/bash
isload="$(cat /tmp/isload)"
if [[ $isload == "y" ]];then
  echo $isload
else
  # mount --types proc /proc /mnt/void/proc
  # mount --rbind /sys /mnt/void/sys
  # mount --make-rslave /mnt/void/sys
  # mount --rbind /dev /mnt/void/dev
  # mount --make-rslave /mnt/void/dev && echo "y" > /tmp/isload

  mount --rbind /sys /mnt/void/sys && mount --make-rslave /mnt/void/sys
  mount --rbind /dev /mnt/void/dev && mount --make-rslave /mnt/void/dev
  mount --rbind /proc /mnt/void/proc && mount --make-rslave /mnt/void/proc


  cat /etc/resolv.conf > /mnt/void/etc/resolv.conf
fi

chroot /mnt/void /bin/bash 
# source /etc/profile
# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
