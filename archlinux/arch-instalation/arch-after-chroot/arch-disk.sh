#!/bin/bash
clear

echo -e "\n**************************\n\n\t 	start ff 5	n\n\n**************************\n" 
use_disk(){
	#cfdisk
	sudo mkfs.ext4 /dev/sda4
	sudo mkswap /dev/sda6
	#[ -f /home ] && echo "file existe" || sudo mkdir /home

}


#++++++++++++++++++++++++++++++++
#		ff		+
#++++++++++++++++++++++++++++++++

use_disk

