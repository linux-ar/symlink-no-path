#!/bin/bash/
sudo rm $HOME/vps-output.mp4 >/dev/null 2>&1
# endVideo use -t not -to
# c-a-d lenght of cut


# URL="https://youtu.be/-bfbtaZ6VXc"
# STARTVIDEO=33
# ENDVIDEO=44
ssh -i ~/.ssh/id_rsa  vps@40.86.167.128 "bash -s" < $HOME/scripts/my/server/exec-in-server.sh $URL $STARTVIDEO $ENDVIDEO
echo "retourn to server .sh" 



scp  -i ~/.ssh/id_rsa vps@40.86.167.128:/home/vps/vid/vps-output.mp4 $HOME/
# termux-open --send $HOME/vps-output.mp4

