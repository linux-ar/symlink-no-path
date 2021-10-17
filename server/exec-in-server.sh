#!/bin/bash
# https://youtu.be/mQal3i1rPm4
# var
# url='https://youtu.be/mQal3i1rPm4'
input="$HOME/vid/vps.mp4"
output="$HOME/vid/vps-output.mp4"

url="$1"
startvideo="$2"
endvideo="$3"
sudo rm $HOME/vid/vps.mp4 >/dev/null 2>&1
sudo rm $HOME/vid/vps.mp4.mkv >/dev/null 2>&1
sudo rm $HOME/vid/vps-output.mp4 >/dev/null 2>&1

youtube-dl \
    -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' \
    -o "$HOME/vid/vps.mp4"                                  \
    $url                                                    \
                                              >/dev/null 2>&1
    
# youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' -o '$HOME/vid/vps.mp4' $url  >/dev/null 2>&1

# # i'm using this comm1nd for rename outpul of youtube-dl
mv $HOME/vid/vps.mp4.mkv $HOME/vid/vps.mp4 >/dev/null 2>&1

ffmpeg                              \
    -ss $startvideo                 \
    -i $input                       \
    -t $endvideo                    \
    -c:v libx264                    \
    -crf 23                         \
    -c:a aac                        \
    -strict -2                      \
    -profile:v baseline             \
    -level 3.0                      \
    -pix_fmt yuv420p                \
    -brand mp42                     \
    -threads 2                      \
    -s hd480                        \
    $output                         \
    -y                              \
                      >/dev/null 2>&1




# ffmpeg                              \
#     -ss $startvideo                 \
#     -i $input                       \
#     -t $endvideo                    \
#     -threads 2                      \
#     -vsync vfr                      \
#     $output                         \
#     -y                              \
#                       >/dev/null 2>&1

# # # -crf 36                         \
# #     # --disable-asm    \
# #     # -vsync vfr     \
# #     # -preset ultrafast     \
# #     # -vcodec libstagefright_h264     \
# # # -vsync vfr                      \
# #     #
# #     #


