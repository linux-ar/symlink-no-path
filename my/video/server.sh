#!/bin/bash/
sudo rm $HOME/vps-output.mp4 >/dev/null 2>&1
# endVideo use -t not -to
# c-a-d lenght of cut
echo "in server.sh $URL $STARTVIDEO $ENDVIDEO"
echo "starting ssh"

var1="https://youtu.be/-bfbtaZ6VXc"
var2=33
var3=44

# URL="https://youtu.be/-bfbtaZ6VXc"
# STARTVIDEO=33
# ENDVIDEO=44
ssh -i ~/.ssh/id_rsa  vps@40.86.167.12 "bash -s" < $HOME/cc.sh "$var1 $var2 $var3"





# ssh -i ~/.ssh/id_rsa  vps@40.86.167.128 '$HOME/cc.sh'
# ssh -i ~/.ssh/id_rsa  vps@40.86.167.128 '$HOME/cc.sh $URL $STARTVIDEO $ENDVIDEO'
# ssh -i ~/.ssh/id_rsa  vps@40.86.167.128 '$HOME/cc.sh `$URL` `$STARTVIDEO` `$ENDVIDEO`'


# scp  -i ~/.ssh/id_rsa vps@40.86.167.128:/home/vps/vid/vps-output.mp4 $HOME/
# termux-open --send $HOME/vps-output.mp4

