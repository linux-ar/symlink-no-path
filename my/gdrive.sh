#!/bin/bash
sudo apt install -y software-properties-common dirmngr gnupg-agent
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AD5F235DF639B041
echo 'deb http://ppa.launchpad.net/alessandro-strada/ppa/ubuntu xenial main' | sudo tee /etc/apt/sources.list.d/alessandro-strada-ubuntu-ppa.list >/dev/null
sudo apt update
sudo apt install -y google-drive-ocamlfuse
# google-drive-ocamlfuse > login.txt
# cat login.txt
sudo apt-get install -y --reinstall xdg-utils
mkdir ~/googledrive
# google-drive-ocamlfuse ~/googledrive
# google-drive-ocamlfuse -headless -label me -id 957403508738-pj7p9q1shiv87ta3eqau4cqlft9ibgki.apps.googleusercontent.com -secret 4ylYWU5nfYePNfwB6tSY6ihw
# google-drive-ocamlfuse -label me ~/googledrive
