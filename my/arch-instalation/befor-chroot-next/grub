#!/bin/bash
clear

echo -e "\n**************************\n\n\t  grub  \n\n**************************\n" 

use_grub(){
	
#		pacman -S grub 	--noprogressbar	--noconfirm 
# 		grub-install  /dev/sdc --bootloader-id=GRUB --removable --recheck 


#		/dev/????????????????		
# 	grub-install /dev/sdc
#		genere les boot
 	grub-mkconfig -o 	/boot/grub/grub.cfg
}



use_grub_efi(){
	pacman -S grub 	--noprogressbar	--noconfirm 
	grub-install --target=x86_64-efi --efi-directory=/boot/ --bootloader-id=GRUB
	grub-mkconfig -o /boot/grub/grub.cfg	
	
	usecho
}

use_bcd(){
	rm /mnt/windows/linux.bin
	rm /mnt/root/linux.bin
	rm /boot/linux.bin

	#dd if=/dev/sda5 of=/mnt/windows/linux.bin bs=512 count=1 
	dd if=/dev/sda5 of=/mnt/windows/linux.bin bs=512 count=1 	
	#dd if=/dev/sda4 of=/mnt/windows/linux.bin bs=512 count=1 

	ls /mnt/windows
	cp /mnt/windows/linux.bin /mnt/root
	cp /mnt/windows/linux.bin /boot

}



use_bootloader(){
	#usecho
	pacman -S refind-efi --noprogressbar --noconfirm
	refind-install
	#blkid /dev/sda1 >> /boot/refind_linux.conf
	#blkid /dev/sda2 >> /boot/refind_linux.conf
	#blkid /dev/sda3 >> /boot/refind_linux.conf
	blkid /dev/sda4 >> /boot/refind_linux.conf
	#blkid /dev/sda5 >> /boot/refind_linux.conf
	

}


use_syslinux(){
	clear
	pacman -S syslinux --noprogressbar --noconfirm 
	clear
	blkid -s PTTYPE -o value /dev/sda 
	fdisk -l /dev/sda
	mkdir /boot/syslinux
	cp -r /usr/lib/syslinux/bios/*.c32 /boot/syslinux
 	extlinux --install /boot/syslinux
 	#M BR
	dd bs=440 count=1 conv=notrunc 	if=/usr/lib/syslinux/bios/mbr.bin 		of=/dev/sda

	# GPT
	# sgdisk /dev/sda --attributes=1:set:2
	# sgdisk /dev/sda --attributes=1:show
	# dd bs=440 count=1 conv=notrunc 	if=/usr/lib/syslinux/bios/gptmbr.bin 		of=/dev/sda


}

	use_grub
	


#	use_grub_efi
#	use_cp_grub
#	use_syslinux
#	use_bootloader


