#!/bin/bash
clear

echo -e "\n**************************\n\n\t 	start ff 5	n\n\n**************************\n" 



use_instalalion(){
	bash befor-chroot/grub
	bash befor-chroot/driver
	bash befor-chroot/adduser
	bash befor-chroot/mv-conf
	bash befor-chroot/dwm
	bash befor-chroot/time
	bash befor-chroot/startup
	bash befor-chroot/autologin
}





#++++++++++++++++++++++++++++++++++++++++
#		instalation		+
#++++++++++++++++++++++++++++++++++++++++


	use_instalalion

