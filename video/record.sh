#!/bin/bash

# TODO refactor /tmp/chrono to /tmp/record
tmpPID="/tmp/screencast.pid"   && touch $tmpPID
PID=$(cat /tmp/screencast.pid)

outputDir="$HOME/screencast" && mkdir -p $outputDir
status="/tmp/ayoub/status" && touch "${status}"

timeStamp=$(date "+%Y%m%d_%H%M%S")
filename="${outputDir}/${timeStamp}.mkv"


if ps -p $PID > /dev/null 2>&1;then
    echo "in ps"
    kill $PID
    echo " " > "${status}"
else
    echo "else"
  # TODO use another script to write "recording. recording.. recording..." in /tmp/chono
  echo "^c#FFFF00^recording...^c#bbbbbb^" > "$status"

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
    & echo $! > "$tmpPID"

fi

