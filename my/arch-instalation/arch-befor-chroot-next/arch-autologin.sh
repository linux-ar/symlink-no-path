#!/bin/bash
clear

echo -e "\n**************************\n\n\t 	start ff 5	n\n\n**************************\n" 



#	is not essaye yet maybe error

use_autologin(){

#i	switch bitween tty 1 .. 6 
#	Edit your /etc/systemd/logind.conf , change #NAutoVTs=6 to NAutoVTs=1

#	on change line ExecStart
#	ExecStart=-/sbin/agetty --autologin root --noclear %I 38400 linux


	cp getty\@tty1.service    /etc/systemd/system/getty.target.wants/getty\@tty1.service
	systemctl enable getty\@tty1.service
	

}
#++++++++++++++++++++++++++++++++
#		ff		+
#++++++++++++++++++++++++++++++++

#	use_autologin


