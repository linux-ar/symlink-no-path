#!/bin/bash
clear

echo -e "\n**************************\n\n\t  chroot	\n\n**************************\n" 

use_chroot(){
	arch-chroot /mnt /bin/bash <<EOF
	bash /win/sc/my/arch-instalation/chroot.sh
EOF
}

#++++++++++++++++++++++++++++++++
#	    chroot EOF		+
#++++++++++++++++++++++++++++++++


	use_chroot

