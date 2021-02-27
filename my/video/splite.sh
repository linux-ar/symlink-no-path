#!/bin/bash
# var
input="$1"
output="$2"
startVideo=$3
endVideo=$4


# (in,out,x,y,w,h)
#ffmpeg -i $1 -filter:v "crop=$5:$6:$3:$4" -c:a copy $2 -y
#ffmpeg -i $input -filter:v "crop=$w:$h:$x:$y" -c:a copy $output -y
# slow but comress my video
# ffmpeg -i $input  -ss $startVideo -t $endVideo -c:a copy  $output -y
# speel but not commress my fideo
# ffmpeg -i $input  -ss $startVideo -t $endVideo -c copy  $output -y

ffmpeg -ss $startVideo -i $input  -t $endVideo -c:a copy $output -y
# not work :why?
# ffmpeg -ss $startVideo -i $output -c copy -t $sratVideo $output -y
##
# -i  input file
# -ss start time in seconds or in hh:mm:ss
# -t how time in seconds or in hh:mm:ss
# -to end time in seconds or in hh:mm:ss
# -c codec to use
##
