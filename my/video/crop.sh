#!/bin/bash
# var
input="ayou.1b.mkv"
output="crop3.mkv"
x=23
y=263
w=1054
h=1054
s=$1
e=$2


# (in,out,x,y,w,h)
#ffmpeg -i $1 -filter:v "crop=$5:$6:$3:$4" -c:a copy $2 -y
#ffmpeg -i $input -filter:v "crop=$w:$h:$x:$y" -c:a copy $output -y
ffmpeg -i $input -ss $s -t $e -filter:v "crop=$w:$h:$x:$y" -async 1 -c:a copy $output -y



#suntax
#ffmpeg -i movie.mp4 -ss 00:00:03 -t 00:00:08 -async 1 cut.mp4





# cli
#ffmpeg -i ayou.1b.mkv -filter:v "crop=1054:1054:23:263" -c:a copy cro1.mp4 -y



# var
#input=$1
#output=$2
#x=$3
#y=$4
#w=$5
#h=$6
#s=$7
#e=$8
