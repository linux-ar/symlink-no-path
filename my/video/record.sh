#!/bin/bash

# ffmpeg \
# 	-f x11grab \
# 	-y \
# 	-video_size 1280x800 \
# 	-i \
# 	-f alsa \
#   -i default \
# 	-c:v libx264 \
#   -r 30 \
# 	-c:a flac\
# 	$filename
tmpPID="/tmp/screencast.pid"
outputDir="$HOME/screencast"
timeStamp=$(date "+%Y%m%d_%H%M%S")
filename="${outputDir}/${timeStamp}.mkv"

if [ -s $tmpPID ]
then
  kill $(cat $tmpPID)
  rm -f $tmpPID
else
  echo " recording... " > /tmp/chrono
  ffmpeg \
    -f x11grab            \
    -y                    \
    -video_size 1280x800 \
    -framerate 30         \
    -i :0                 \
    -vcodec libx264       \
    -preset ultrafast     \
    -qp 0                 \
    -pix_fmt yuv444p      \
    $filename             \
    & echo $! > $tmpPID
fi

echo "" > /tmp/chrono
