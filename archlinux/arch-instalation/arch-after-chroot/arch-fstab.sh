#!/bin/bash
clear

echo -e "\n**************************\n\n\t 	start ff 5	n\n\n**************************\n" 

use_fstab(){

	[ -f /mnt/etc/fstab ] && rm  /mnt/etc/fstab 
	genfstab -U /mnt >> /mnt/etc/fstab
	cat /mnt/etc/fstab


}
#++++++++++++++++++++++++++++++++
#		ff		+
#++++++++++++++++++++++++++++++++



#use_fstab

