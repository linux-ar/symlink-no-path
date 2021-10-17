#!/bin/bash
clear 
	
use_ftp(){
	myfile="/mnt/home/t/dwm.tar"
	to_path="/arch/"

	ftp -i -n $HOST 21 << END_SCRIPT
	quote USER $username
	quote PASS $password
	cd $to_path
	put $myfile
	!
END_SCRIPT

}




	use_ftp
