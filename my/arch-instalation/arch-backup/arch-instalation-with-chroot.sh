#!/bin/bash
clear

echo -e "\n**************************\n\n\t 	start ff 5	n\n\n**************************\n" 



use_global_instalalion(){
	# use_mount
	pacman -Sy reflector --noconfirm
 	reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
 
	use_pacstrap
	use_fstab
	use_chroot
}
use_non_chroot_instalation(){
	
#	use_confi_mv
	#use_confi_user
	#use_startup
	#use_grub
}



#++++++++++++++++++++++++++++++++
#		ff		+
#++++++++++++++++++++++++++++++++



