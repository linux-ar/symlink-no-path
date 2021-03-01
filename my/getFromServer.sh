#!/data/data/com.termux/files/usr/bin/zsh
#copy vps/home/file.txt termux/home/
host="$1"
file="$2"
scp  -i ~/.ssh/id_rsa   vps@$host:/home/vps/$file $HOME/
