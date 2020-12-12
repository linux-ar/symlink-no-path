#!/bin/bash
clear

echo -e "\n**************************\n\n\t 	start ff 5	n\n\n**************************\n" 


use_mount(){

	#must mount system ext4 befor anything & finalemnet mount ntfs or boot int /mnt/boot
	
	sudo mount 	/dev/sdc2 	/mnt
	mkdir /mnt/boot
	sudo mount	/dev/sdc1 	/mnt/boot


	#sudo mount	/dev/sda1	/mnt/windows
	#sudo swapon	/dev/sda6	

	sudo lsblk
	echo -e "\t ls windows"
	ls /mnt/win
} 
 
#++++++++++++++++++++++++++++++++
#		ff		+
#++++++++++++++++++++++++++++++++

	use_mount

