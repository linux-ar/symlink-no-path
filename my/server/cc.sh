#!/bin/bash
# https://youtu.be/mQal3i1rPm4
# var
# url='https://youtu.be/mQal3i1rPm4'
input="$HOME/vid/vps.mp4"
output="$HOME/vid/vps-output.mp4"

url="$1"
startvideo=$2
endvideo=$3
echo "... load cc.sh"
echo "in cc.sh $url $startvideo $endvideo ..." >> work.txt
sudo rm $HOME/vid/vps.mp4 >/dev/null 2>&1
sudo rm $HOME/vid/vps.mp4.mkv >/dev/null 2>&1
sudo rm $HOME/vid/vps-output.mp4 >/dev/null 2>&1

youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' -o '$HOME/vid/vps.mp4' $url

# # i'm using this comm1nd for rename outpul of youtube-dl
mv $HOME/vid/vps.mp4.mkv $HOME/vid/vps.mp4 >/dev/null 2>&1

ffmpeg                              \
    -ss $startvideo                 \
    -i $input                       \
    -t $endvideo                    \
    -b: 500k                        \
    -crf 26                         \
    $output                         \
    -y                              \

# #     # --disable-asm    \
# #     # -vsync vfr     \
# #     # -preset ultrafast     \
# #     # -threads 8                      \
# #     # -vcodec libstagefright_h264     \
# #     #
# #     #


