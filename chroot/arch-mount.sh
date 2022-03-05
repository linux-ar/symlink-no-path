#!/bin/bash
isload="$(cat /tmp/isload)"
if [[ $isload == "y" ]];then
  echo $isload
else
  echo "y" > /tmp/isload
  mount --types proc /proc /mnt/arch/proc
  mount --rbind /sys /mnt/arch/sys
  mount --make-rslave /mnt/arch/sys
  mount --rbind /dev /mnt/arch/dev
  mount --make-rslave /mnt/arch/dev 
fi

chroot /mnt/arch /bin/zsh 
# source /etc/profile
# export PS1="\[\e]0;\u@\h: \w\a\]${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$"
