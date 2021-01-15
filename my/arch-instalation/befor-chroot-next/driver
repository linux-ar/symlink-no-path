#!/bin/bash
clear

echo -e "\n**************************\n\n\t 	start ff 5	n\n\n**************************\n" 


use_driver(){
#	driver_EGPU="nvidia"
#	driver_vulcan="vulkan-icd-loader vulkan-intel"

	driver_GPU="xf86-video-intel"
	driver_acceleration_CPU="intel-media-driver"
	pacman -Syu --noconfirm    mesa 	$driver_GPU	 $driver_acceleration_CPU
#	VM
#	pacman -Syu --noconfirm    xf86-input-vmmouse  xf86-video-vmware open-vm-tools
#	systemctl enable vmwaretools.service 

}


#++++++++++++++++++++++++++++++++
#		driver		+
#++++++++++++++++++++++++++++++++

	use_driver

