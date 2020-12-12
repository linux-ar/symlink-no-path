#!/bin/bash
clear 

use_autologin(){


	#switch bitween tty 1 .. 6 
	#Edit your /etc/systemd/logind.conf , change #NAutoVTs=6 to NAutoVTs=1

	#on change line ExecStart
	#ExecStart=-/sbin/agetty --autologin root --noclear %I 38400 linux
	cd /home/t/backup/instalation
	cp getty\@tty1.service    /etc/systemd/system/getty.target.wants/getty\@tty1.service
	systemctl enable --now getty\@tty1.service
}	



	use_autologin
