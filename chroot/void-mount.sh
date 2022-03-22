#!/bin/bash
isload="$(cat /tmp/isload)"
if [[ $isload == "y" ]];then
  echo $isload
else
  # mount --types proc /proc /sdcard/proc
  # mount --rbind /sys /sdcard/sys
  # mount --make-rslave /sdcard/sys
  # mount --rbind /dev /sdcard/dev
  # mount --make-rslave /sdcard/dev && echo "y" > /tmp/isload

  mount --rbind /sys /sdcard/sys && mount --make-rslave /sdcard/sys
  mount --rbind /dev /sdcard/dev && mount --make-rslave /sdcard/dev
  mount --rbind /proc /sdcard/proc && mount --make-rslave /sdcard/proc


  cat /etc/resolv.conf > /sdcard/etc/resolv.conf
fi

chroot /sdcard /bin/bash 
# source /etc/profile
# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
