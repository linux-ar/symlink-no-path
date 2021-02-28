#!/bin/bash
# https://youtu.be/mQal3i1rPm4
# var
# url='https://youtu.be/mQal3i1rPm4'
input="$HOME/vid/vps.mp4.mkv"
output="$HOME/vid/vps-output.mp4"

url="$1"
startVideo="$2"
endVideo="$3"

sudo rm $HOME/vid/vps.mp4 >/dev/null 2>&1
sudo rm $HOME/vid/vps.mp4.mkv >/dev/null 2>&1
sudo rm $HOME/vid/vps-output.mp4 >/dev/null 2>&1

youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' -o '$HOME/vid/vps.mp4' $url


ffmpeg                              \
    -y                              \
    -ss $startVideo                 \
    -i $input                       \
    -b: 500k                        \
    -crf 26                         \
    -t $endVideo                    \
    $output     

#     # --disable-asm    \
#     # -vsync vfr     \
#     # -preset ultrafast     \
#     # -threads 8                      \
#     # -vcodec libstagefright_h264     \
#     #
#     #


