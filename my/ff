#!/bin/bash
clear

echo -e "\n**************************\n\n\t 	start ff 	n\n\n**************************\n" 
echo  -e "   sleep 1s....."
sleep 1
#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			  	   ff					+
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
	tty1="getty@tty1.service"
    bash_profile=".bash_profile"



#keyboard keymap fr+123
# loadkeys us -------------
#wifi-menu
#ping google.com
# nano /etc/vconsole.conf
# pacman -S reflector
# cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
#reflector -c "US" -f 12 -l 10 -n 12 --save /etc/pacman.d/mirrorlist
#timedatectl set-timezone Europe/Paris ou
#locale-gen
#echo LANG=en_GB.UTF-8 > /etc/locale.conf
#export LANG=en_GB.UTF-8


# printf "somewords\nsomewords\n" | passwd username
#nmcli device wifi list
#nmcli device connect your_network_name password your_password
#perl -i -pe 's/# (%wheel ALL=\(ALL\) ALL)/$1/' /etc/sudoers
#yay

#sysliniux cfg sda5 to sda4


#bit.ly/3duNpQZ
#ftp my pc use in vm win

use_bcd(){
	#sudo mount /dev/sda3 /mnt/windows



	rm /mnt/windows/linux.bin
	rm /mnt/root/linux.bin
	rm /boot/linux.bin

	#dd if=/dev/sda5 of=/mnt/windows/linux.bin bs=512 count=1 
	dd if=/dev/sda5 of=/mnt/windows/linux.bin bs=512 count=1 	
	#dd if=/dev/sda4 of=/mnt/windows/linux.bin bs=512 count=1 

	ls /mnt/windows
	cp /mnt/windows/linux.bin /mnt/root
	cp /mnt/windows/linux.bin /boot

}
use_grub(){
	
	pacman -S grub 	--noprogressbar	--noconfirm 
	#grub-install	 	/dev/sda
	grub-install --target=i386-pc --debug /boot
	sleep 3

	#genere les boot
	grub-mkconfig -o 	/boot/grub/grub.cfg
	}



use_grub_efi(){
	pacman -S grub 	--noprogressbar	--noconfirm 
	grub-install --target=x86_64-efi --efi-directory=/boot/ --bootloader-id=GRUB
	grub-mkconfig -o /boot/grub/grub.cfg	
	
	usecho
}

use_bootloader(){
	#usecho
	pacman -S refind-efi --noprogressbar --noconfirm
	refind-install
	#blkid /dev/sda1 >> /boot/refind_linux.conf
	#blkid /dev/sda2 >> /boot/refind_linux.conf
	#blkid /dev/sda3 >> /boot/refind_linux.conf
	blkid /dev/sda4 >> /boot/refind_linux.conf
	#blkid /dev/sda5 >> /boot/refind_linux.conf
	

}


use_syslinux(){
	clear
	pacman -S syslinux --noprogressbar --noconfirm 
	clear
	blkid -s PTTYPE -o value /dev/sda 
	fdisk -l /dev/sda
	mkdir /boot/syslinux
	cp -r /usr/lib/syslinux/bios/*.c32 /boot/syslinux
 	extlinux --install /boot/syslinux
 	#M BR
	dd bs=440 count=1 conv=notrunc 	if=/usr/lib/syslinux/bios/mbr.bin 		of=/dev/sda

	# GPT
	# sgdisk /dev/sda --attributes=1:set:2
	# sgdisk /dev/sda --attributes=1:show
	# dd bs=440 count=1 conv=notrunc 	if=/usr/lib/syslinux/bios/gptmbr.bin 		of=/dev/sda


}


use_chroot(){
	arch-chroot /mnt /bin/bash <<EOF

#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			use_app_chroot				+
#+										+
#++++++++++++++++++++++++++++++++++++++++
	pacstrap /mnt base linux linux-firmware grub efibootmgr ntfs-3g os-prober sudo nano wget intel-ucode vim reflector htop iw wpa_supplicant dialog etworkmanager xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxinerama git make tar base-devel  libx11 libxft terminus-font
 
#++++++++++++++++++++++++++++++++++++++++
#+										+
#+				use_fstab				+
#+										+
#++++++++++++++++++++++++++++++++++++++++

	[ -f /mnt/etc/fstab ] && rm  /mnt/etc/fstab || sudo echo "file not existe"
	genfstab -U /mnt >> /mnt/etc/fstab
	cat /mnt/etc/fstab


#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			use_grub 	 				+
#+										+
#++++++++++++++++++++++++++++++++++++++++

	grub-install --target=i386-pc --debug /dev/sda
	
	grub-mkconfig -o /boot/grub/grub.cfg	
	
#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			use_add_user 				+
#+										+
#++++++++++++++++++++++++++++++++++++++++
	
	sudo useradd -m -G wheel -s /bin/bash t
	echo "t:t" 		| chpasswd
	echo "root:t" 	| chpasswd

#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			use_confi_mv				+
#+										+
#++++++++++++++++++++++++++++++++++++++++
	wget    $ftparch$hostname
	sudo	sed -i 's/\r$//' hostname
	sudo 	cp hostname  	/etc/hostname

	wget    $ftparch$sudoers
	sudo	sed -i 's/\r$//' sudoers
	sudo 	cp sudoers  	/etc/sudoers

	wget    $ftparch$hosts
	sudo	sed -i 's/\r$//' hosts
	sudo	cp hosts 		 /etc/hosts	

#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			use_time_local 				+
#+										+
#++++++++++++++++++++++++++++++++++++++++	
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
	locale-gen
	#export LANG=en_US.UTF-8
	echo "LANG=en_US.UTF-8" >> /etc/locale.conf
	ln -s /usr/share/zoneinfo/Europe/Brussels /etc/localtime




#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			use_driver 				+
#+										+
#++++++++++++++++++++++++++++++++++++++++
    # PACKAGES_DRIVER="nvidia"
      PACKAGES_DDX="xf86-video-intel"
    # PACKAGES_VULKAN="vulkan-icd-loader vulkan-intel"
      PACKAGES_HARDWARE_ACCELERATION="intel-media-driver"
    # pc drive
      pacman -Syu --noconfirm    mesa 		$PACKAGES_DDX		$PACKAGES_HARDWARE_ACCELERATION
    # vm drive
      pacman -Syu --noconfirm    xf86-input-vmmouse  xf86-video-vmware open-vm-tools

      systemctl enable vmwaretools.service 


#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			use_dwm						+
#+										+
#++++++++++++++++++++++++++++++++++++++++
	sudo pacman -S --noconfirm    xorg-server xorg-xinit xorg-xrand xorg-xsetroot libxinerama
	sudo pacman -S --noconfirm     git make tar 
	sudo pacman -S --noconfirm    base-devel  libx11 libxft   terminus-font

	cd /home/t/
 	git clone https://git.suckless.org/dwm
    cd dwm 
    sudo make clean install 

    cd /home/t/
    git clone https://git.suckless.org/dmenu
    cd dmenu 
    sudo make clean install 

	cd /home/t/
	git clone https://git.suckless.org/st
    cd st
    sudo make clean install 





#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			auto login					+
#+										+
#++++++++++++++++++++++++++++++++++++++++
	wget    $ftparch$tty
	sed 	-i 's/\r$//' getty@tty1.service
	chmod +x getty@tty1.service
	#cp getty@tty1.service    /etc/systemd/system/getty.target.wants/getty\@tty1.service
	#systemctl enable getty\@tty1.service
	clear
	echo "/etc/systemd/system/getty.target.wants/getty\@tty1.service"
	echo "systemctl enable getty\@tty1.service"
	#not tested

#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			use_startup 				+
#+										+
#++++++++++++++++++++++++++++++++++++++++
	systemctl 	enable 	NetworkManager
	sudo systemctl enable sshd

EOF
}

usecho(){
	echo -e "\n+++++++++++++++++++++++++++++++\n"
}
use_disk(){
	#cfdisk
	sudo mkfs.ext4 /dev/sda4
	sudo mkswap /dev/sda6
	#[ -f /home ] && echo "file existe" || sudo mkdir /home

}
use_mount(){
	sudo lsblk
	usecho

	# [ -f /mnt/windows ] && echo "file existe" || mkdir /mnt/windows
	[ -f /mnt/boot ] && echo "file existe" || mkdir /mnt/boot
	[ -f /mnt/root ] && echo "file existe" || mkdir /mnt/root
	usecho

	# sudo pacman -S ntfs-3g os-prober --noprogressbar	--noconfirm 
	usecho

	clear

	#must mount ext4 et finalemnet mount ntfs

	sudo mount 	/dev/sda4 	/mnt
	#sudo mount	/dev/sda1 	/mnt/boot
	# sudo mount	/dev/sda1	/mnt/windows
	#sudo swapon	/dev/sda6	

	usecho
	sudo lsblk
	usecho
	echo -e "\t ls windows"
	usecho
	# ls /mnt/windows
	usecho
}
use_pacstrap(){
	pacstrap /mnt base linux linux-firmware grub efibootmgr ntfs-3g os-prober sudo nano wget intel-ucode vim reflector htop iw wpa_supplicant dialog etworkmanager xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxinerama git make tar base-devel  libx11 libxft terminus-font
 
}
use_fstab(){

	[ -f /mnt/etc/fstab ] && rm  /mnt/etc/fstab || sudo echo "file not existe"
	genfstab -U /mnt >> /mnt/etc/fstab
	cat /mnt/etc/fstab

	usecho
}
use_cp_script(){
	#if use EOF this foncontion not nessesere
	cp load /mnt/root
	cp update /mnt/root
	chmod +x /mnt/root/load
	chmod +x /mnt/root/update
}






use_add_user(){
	useradd -m -G wheel -s /bin/bash t
	echo "t:t" 		| chpasswd
	echo "root:t" 	| chpasswd
}

use_confi_mv(){
	wget    $ftparch$hostname
	sed -i 's/\r$//' hostname
	mv hostname  	/etc/hostname

	wget    $ftparch$sudoers
	sed -i 's/\r$//' sudoers
	mv sudoers  	/etc/sudoers

	wget    $ftparch$hosts
	sed -i 's/\r$//' hosts
	mv hosts 		 /etc/hosts
}
use_time_local(){
	echo "en_US.UTF-8 UTF-8" > /etc/locale.gen
	locale-gen
	#export LANG=en_US.UTF-8
	echo "LANG=en_US.UTF-8" >> /etc/locale.conf
	ln -s /usr/share/zoneinfo/Europe/Brussels /etc/localtime

	
}

use_driver(){
	#driver_EGPU="nvidia"
    driver_GPU="xf86-video-intel"
    #driver_vulcan="vulkan-icd-loader vulkan-intel"
    driver_acceleration_CPU="intel-media-driver"
    pacman -Syu --noconfirm    mesa 	$driver_GPU	 $driver_acceleration_CPU
    # VM
    #pacman -Syu --noconfirm    xf86-input-vmmouse  xf86-video-vmware open-vm-tools
    #systemctl enable vmwaretools.service 

}
use_lib_dwm(){
	#usecho

    pacman -Sy --noconfirm xorg-server xorg-xinit xorg-xrandr xorg-xsetroot libxinerama git make tar base-devel  libx11 libxft terminus-font
 

}
use_git_dwm(){
	#usecho
	cd
    git clone https://git.suckless.org/dwm
    cd dwm 
    make clean install 
}
use_git_dmenu(){
	#usecho
	cd
    git clone https://git.suckless.org/dmenu
    cd dmenu 
    make clean install 

}
use_git_st(){
	#usecho
	cd

    git clone https://git.suckless.org/st
    cd st
    make clean install 
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

	use_git_dwm
	use_git_st
	use_git_dmenu
	
	use_cp_init_dwm

    #startx
}


use_startup(){
	systemctl 		enable 		NetworkManager
}
#error is not essaye
use_autologin(){


	#switch bitween tty 1 .. 6 
	#Edit your /etc/systemd/logind.conf , change #NAutoVTs=6 to NAutoVTs=1

	#on change line ExecStart
	#ExecStart=-/sbin/agetty --autologin root --noclear %I 38400 linux


	wget    $ftparch$tty
	sed 	-i 's/\r$//' getty\@tty1.service
	chmod +x getty\@tty1.service
	cp getty\@tty1.service    /etc/systemd/system/getty.target.wants/getty\@tty1.service
	systemctl enable getty\@tty1.service
	

}

use_instalalion(){
	# use_mount
	pacman -Sy reflector --noconfirm
 	reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
 
	use_pacstrap
	use_fstab
	#use_cp_script
	use_chroot

	#reboot

	#++++ arch-chroot +++ cd root +++  bash update in first time  +++ bash app_chroot +++ bash load 
	#use_app_chroot
	#use_app
	#use_confi_mv
	#use_confi_user
	#use_startup
	#use_bcd
	#use_grub
	#mkinitcpio -p linux
	#use_syslinux
}
use_ssh(){
	sudo pacman -S openssh --noconfirm
	sudo systemctl enable sshd
	sudo systemctl start sshd
}
use_ftp(){
	#usecho
	
	myfile="refind_linux.conf"
	from_path="/mnt/boot/"
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


use_cp(){
	myfile="refind_linux.conf"
	from_path=$linux
	to_path="/mnt/boot/"

	usecho
	from_host=$ftp$from_path$myfile
	wget    $from_host
	ls
	sed -i 's/\r$//' $myfile
	chmod 777 $myfile
	mv $myfile  	$to_path$myfile

	#grub-mkconfig -o /boot/grub/grub.cfg
}

use_curl(){
	usecho
	
# Download file
#curl --netrc --remote-name 		$ftp$upload
# Upload file
#curl --user me: --upload-file fff 	ftp://192.168.1.116:21/linux

}
use_sleep(){
	echo -e "++++++++++++++++\n+\n+\t sleep \t+\n+\n++++++++++++++++"
	sleep 3s
}



#++++++++++++++++++++++++++++++++++++++++
#+										+
#+			fonction					+
#+										+
#++++++++++++++++++++++++++++++++++++++++
#	isntalation:
#	RAM= fix keybload +wifi+reflector for spped server 
#	arch-chroot = ...
#	update + wget + clone loadind +sed + chmod +bash loading
#   mount windows +mount other
#	instalalion basic after grube
#
#	after arch-chroot /mnt : cp loading.sh /mnt/root
#   update+ musta install sudo+bash loading.sh

##use_instalalion


#use_var
#use_disk
# use_mount
#use_pacstrap
#use_fstab
#use_cp_script
#use_chroot
#++++ arch-chroot +++ cd root +++  bash update in first time  +++ bash app_chroot +++ bash load 
# pacman -S reflector --noconfirm
# reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
# #nano /etc/pacman.d/mirrorlist
# use_app_chroot
# use_confi_user
#use_confi_mv
use_time_local

# use_startup
# #use_bcd

# use_grub
# use_grub_efi
# use_dwm

#use_cp_grub
#use_syslinux
#use_bootloader

#use_vsftpd
#use_ftp
#use_cp
#use_curl
#mkinitcpio -p linux
#add for xinit
# pacman -S libinput 
echo -e "\n\n\t fin ff \n"
