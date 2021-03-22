#!/bin/bash
	clear 
	echo -e "\n**************************\n" 
	echo -e "\tstart start "
	echo -e "\n\n\n**************************\n" 
	#++++++++++++++++++++++++++++++++++++++++
	#+										+
	#+			  	   start					+
	#+										+
	#++++++++++++++++++++++++++++++++++++++++
	HOST="192.168.1.116"
	ftparch="ftp://me@192.168.1.116/arch/"
	ftplinux="ftp://me@192.168.1.116/linux/"
	ftp="ftp://me@192.168.1.116"	
	arch="/arch/"
	linux="/linux/"
	username="me"
	password=""

	hostname="hostname"
	sudoers="sudoers"
	hosts="hosts"
	xinitrc=".xinitrc"
	tty="getty@tty1.service"
	bash_profile=".bash_profile"



	#disk manager
	usecho(){
	echo -e "\n+++++++++++++++++++++++++++++++\n"
	}
	use_app(){
	usecho
	}
	use_pacman_fix(){
	usecho
	sudo rm /var/lib/pacmanls/db.lck
	sudo pacman -Sy
	}
	use_driver(){
	#usecho

	PACKAGES_DRIVER="nvidia"
	PACKAGES_DDX="xf86-video-intel"
	PACKAGES_VULKAN="vulkan-icd-loader vulkan-intel"
	#PACKAGES_HARDWARE_ACCELERATION="intel-media-driver"
	#pacman -Syu --noconfirm    mesa $PACKAGES_DDX $PACKAGES_VULKAN 	$PACKAGES_HARDWARE_ACCELERATION
	# VM
	pacman -Syu --noconfirm    xf86-input-vmmouse  xf86-video-vmware open-vm-tools
	systemctl enable vmwaretools.service 


	}

	use_lightdm(){
	usecho
	#systemctl enable lightdm.service
	#systemctl disable lightdm.service
	systemctl start lightdm.service

	#systemctl start gdm.service

	}
use_yay(){
	git clone https://aur.archlinux.org/yay.git
	ls
	cd yay 
	echo starting
	makepkg -si
        
	echo " yay -S  nodejs"
}
use_ly(){
	usecho
	# C99 compiler ++ C standard library ++ make ++ pam ++ xcb ++ xorg ++ xorg-xauth ++ mcookie ++ tput ++ shutdown
	git clone https://github.com/nullgemm/ly.git
	cd ly
	make github
	make
	sudo make run
	sudo make install

	sudo systemctl enable ly.service
}

use_i3(){
	usecho
    sudo pacman -Syu --noconfirm     i3-wm i3blocks i3lock i3status dmenu rxvt-unicode lightdm lightdm-gtk-greeter xorg-server
}
use_lib_dwm(){
	#usecho
	pacman -Sy --noconfirm    xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxinerama git make tar  base-devel  libx11 libxft   terminus-font
 
}
use_git_dwm(){
	#usecho
	cd /home/t
    git clone https://git.suckless.org/dwm
    cd dwm 
    sudo make clean install 

}
use_git_dmenu(){
	#usecho
	cd /home/t
    git clone https://git.suckless.org/dmenu
    cd dmenu 
    sudo make clean install 

}
use_git_st(){
	#usecho
	cd /home/t

    git clone https://git.suckless.org/st
    cd st
    sudo make clean install 
}
use_cp_init_dwm(){
	#usecho

	test -f $xinitrc 		&& sudo rm  $xinitrc
	test -f $bash_profile 	&& sudo rm  $bash_profile


 	cd /home/t/
	wget    $ftparch$xinitrc
	sed 	-i 's/\r$//' .xinitrc 
	chmod +x .xinitrc

 	cd /home/t/
	wget    $ftparch$bash_profile
	sed 	-i 's/\r$//' .bash_profile
	chmod +x .bash_profile


	# startx without any windows manager or service 
	#https://wiki.gentoo.org/wiki/X_without_Display_Manager

}

use_dwm(){
	#usecho
	use_lib_dwm

#	use_git_dwm
#	use_git_st
#	use_git_dmenu
	
#	use_cp_init_dwm

    #startx
}
use_app(){
	pacman -Sy #firefox
	yay -Sy google-chrome 
}
use_autologin(){


	#switch bitween tty 1 .. 6 
	#Edit your /etc/systemd/logind.conf , change #NAutoVTs=6 to NAutoVTs=1

	#on change line ExecStart
	#ExecStart=-/sbin/agetty --autologin root --noclear %I 38400 linux


	wget    $ftp$linux$tty
	sed 	-i 's/\r$//' getty\@tty1.service
	chmod +x getty@tty1.service
	mv getty\@tty1.service    /etc/systemd/system/getty.target.wants/getty\@tty1.service
	systemctl disable getty\@tty1.service
	

}
use_ftp(){
	#usecho
	
	myfile="getty@tty1.service"
	from_path="/etc/systemd/system/getty.target.wants/"
	to_path=$linux

	usecho
	cp $from_path$myfile .
	ftp -i -n $HOST 21 << END_SCRIPT
	quote USER $username
	quote PASS $password
	cd $to_path
	put $myfile
	!
END_SCRIPT

}
#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			fonction					+
#+										+
#++++++++++++++++++++++++++++++++++++++++

use_driver
#use_i3
#use_dwm
# reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
# use_git_dmenu
# use_cp_init_dwm

# use_autologin
# use_ftp
#use_lightdm
# yay -S emptty-git
#use_yay
#use_ly
#echo "https://wiki.gentoo.org/wiki/X_without_Display_Manager"
echo "https://www.reddit.com/r/archlinux/comments/19634t/does_anyone_know_how_to_change_the_dwm_status_bar/"
echo "https://dwm.suckless.org/patches/pango/"
echo "https://github.com/LukeSmithxyz/dwmblocks.git"
# yay -Sy  libxft-bgra



#systemctl enable getty@tty1
# printf "somewords\nsomewords\n" | passwd username
#nmcli device wifi list
#nmcli device connect your_network_name password your_password
#perl -i -pe 's/# (%wheel ALL=\(ALL\) ALL)/$1/' /etc/sudoers
#curl -sL https://bit.ly/2F3CATp | bash

#Display managers: GDM, SDDM, Lightdm, lxdm
#Graphics controller: intel, nvidia, amd with optionally early KMS start
#Intel and AMD processors microcode
#Optional file swap (not supported in btrfs)
#VirtualBox guest utils
#WPA WIFI network installation
#AUR utility installation (aurman, yay)
#Packer support for testing in VirtualBox


#pacman -S grub networkmanager network-manager-applet wireless_tools wpa_supplicant dialog os-prober mtools dosfstools base-devel linux-headers reflector git bluez bluez-utils cups xdg-utils xdg-user-dirs pulseaudio-bluetooth
#Install Fonts:
#yay -S ttf-ms-fonts
#install backup et enable it
#yay -S timeshift && sudo systemctl enable fstrim.timer
#time sync by network
#timedatectl set-ntp true
#install bind-tools for host google.com
# pacman -S bind-tools

# xsetroot -name "$(echo -e '\uE015')"

# fix java windows dw
# pacman -S wmname
# wmname LG3D


xmodmap -pke | grep Alt_R

# To disable focus follows mouse behaviour comment out the following line in definiton of struct handler in dwm.c

# [EnterNotify] = enternotify, 



