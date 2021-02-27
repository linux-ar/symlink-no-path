#!/bin/bash
# var
# input="$1"
# output="$2"
# startVideo=$3
# endVideo=$4


# (in,out,x,y,w,h)
#ffmpeg -i $1 -filter:v "crop=$5:$6:$3:$4" -c:a copy $2 -y
#ffmpeg -i $input -filter:v "crop=$w:$h:$x:$y" -c:a copy $output -y
# ffmpeg  -ss $sratVideo -i $input -c copy -t $endVideo  $output -y
ffmpeg -ss 30 -i first.mp4 -c copy -t 10 output.mp4
##
# -i  input file
# -ss start time in seconds or in hh:mm:ss
# -t how time in seconds or in hh:mm:ss
# -to end time in seconds or in hh:mm:ss
# -c codec to use
##
