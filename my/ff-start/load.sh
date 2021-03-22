#!/bin/bash
#test -f f.sh && sudo rm -r f.sh 
#sudo pacman -Syy
#pacman -S wget
#pacman -S wget
#sed -i 's/\r$//' loadingsh
ftp="ftp://me@192.168.1.116/arch/"
FILE=ff
#FILE=start

clear
test -f $FILE 	&& sudo rm  $FILE*




#if test -f "$FILE"; then
#    echo "$FILE exists."
#    sudo rm  ff
#fi


#test -f /etc/resolv.conf && echo "$FILE exists."
#if [[ -f FILE && -f FILEINROOT ]]; then
#	sudo rm  ff
#    echo "Both files exist."
#fi

echo "finich" 
wget    $ftp$FILE
sed -i 's/\r$//' $FILE
sudo chmod +x $FILE
sudo chown t:t $FILE
	

if test -f update ; then
    echo "update update exists."
else
    wget    $ftpupdate 
    sudo sed 	-i 's/\r$//' update 
    sudo chmod 	+x update
fi


bash $FILE
