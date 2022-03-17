#!/bin/bash

#TODO: refactor /tmp/chrono to /tmp/record
tmpPID="/tmp/screencast.pid"
outputDir="$HOME/screencast"
timeStamp=$(date "+%Y%m%d_%H%M%S")
filename="${outputDir}/${timeStamp}.mkv"
mkdir -p $outputDir
#TODO: if ffmpeg not run , by kill with external command , you must start recording

if [ -s $tmpPID ]
then
  kill $(cat $tmpPID)
  rm -f $tmpPID
  #TODO: use sed to remode line "recording..."
  echo "" > /tmp/chrono
  kill_loop=false
  # pkill record.sh || echo
else
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
  #TODO: use another script to write "recording. recording.. recording..." in /tmp/chono
  echo " recording... " > /tmp/chrono
fi

