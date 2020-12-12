#!/bin/bash
clear 


use_yay(){
	git clone https://aur.archlinux.org/yay.git
	cd yay
	makepkg -si
	yay --version
}


	use_yay
