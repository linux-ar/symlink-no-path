#!/bin/bash
# var
input="$1"
output="$2"
x=23
y=263
w=1054
h=1054
startVideo=$3
endVideo=$4


# (in,out,x,y,w,h)
#ffmpeg -i $1 -filter:v "crop=$5:$6:$3:$4" -c:a copy $2 -y
#ffmpeg -i $input -filter:v "crop=$w:$h:$x:$y" -c:a copy $output -y
ffmpeg -i $input -ss $sratVideo -t $endVideo -filter:v "crop=$w:$h:$x:$y" -async 1 -c:a copy $output -y


