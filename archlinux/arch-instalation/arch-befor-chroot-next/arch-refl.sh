#!/bin/bash


use_instalation(){
# 	pacman -Sy reflector --noconfirm
 	reflector --verbose --latest 25 --sort rate --save /etc/pacman.d/mirrorlist
}


	use_instalation
