#!/bin/bash
clear 


use_lightdm(){
	sudo pacman -Sy lightdm
	systemctl enable --now lightdm.service
}


	use_lightdm
