#!/bin/bash/
sudo rm $HOME/vps-output.mp4 >/dev/null 2>&1
ssh -i ~/.ssh/id_rsa  vps@40.86.167.128 '$HOME/cc.sh https://youtu.be/TOf35SRT1A4  0 15'


scp  -i ~/.ssh/id_rsa vps@40.86.167.128:/home/vps/vid/vps-output.mp4 $HOME/
termux-open --send $HOME/vps-output.mp4
