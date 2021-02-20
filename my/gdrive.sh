#!/bin/bash
sudo apt install -y software-properties-common dirmngr gnupg-agent
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AD5F235DF639B041
echo 'deb http://ppa.launchpad.net/alessandro-strada/ppa/ubuntu xenial main' | sudo tee /etc/apt/sources.list.d/alessandro-strada-ubuntu-ppa.list >/dev/null
sudo apt update
sudo apt install -y google-drive-ocamlfuse
google-drive-ocamlfuse > login.txt
cat login.txt
sudo apt-get install -y --reinstall xdg-utils
mkdir ~/googledrive
google-drive-ocamlfuse ~/googledrive
