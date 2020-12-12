#!/bin/bash
clear

echo -e "\n**************************\n\n\t 	start ff 5	n\n\n**************************\n" 

}
use_lib_dwm(){
	#usecho

	pacman -Sy --noconfirm xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxinerama git make tar base-devel  libx11 libxft terminus-font
}
use_git_dwm(){
#	cd
#	git clone https://git.suckless.org/dwm

	cd  /home/t/app/suckless/dwm
	make clean install 
}
use_git_dmenu(){
#	cd
#	git clone https://git.suckless.org/dmenu

	cd  /home/t/app/suckless/dmenu
	make clean install 
}
use_git_st(){
#	cd 
#	git clone https://git.suckless.org/st

	cd  /home/t/app/suckless/st
	make clean install 
}
use_init_dwm(){
# 	cd 
	chmod +x .xinitrc
	chmod +x .bashrc
	chmod +x .bash_profile
	chmod +x .alias
	chmod +x .Xmodmap
}

use_dwm(){
	use_lib_dwm

	use_git_dwm
	use_git_st
	use_git_dmenu
	
	use_init_dwm

    #startx
}

#++++++++++++++++++++++++++++++++
#		ff		+
#++++++++++++++++++++++++++++++++

	use_dwm

