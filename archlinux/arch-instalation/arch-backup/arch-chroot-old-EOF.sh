#!/bin/bash
clear

echo -e "\n**************************\n\n\t  chroot	\n\n**************************\n" 

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

#++++++++++++++++++++++++++++++++
#		ff		+
#++++++++++++++++++++++++++++++++


	use_chroot

