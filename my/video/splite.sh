#!/bin/bash
# var
input="$1"
output="$2"
startVideo=$3
endVideo=$4
# you must add this ligne if you want use mp4
# -hide_banner

# (in,out,x,y,w,h)
#ffmpeg -i $1 -filter:v "crop=$5:$6:$3:$4" -c:a copy $2 -y
#ffmpeg -i $input -filter:v "crop=$w:$h:$x:$y" -c:a copy $output -y
# slow but comress my video
# ffmpeg -i $input  -ss $startVideo -t $endVideo -c:a copy  $output -y
# speel but not commress my fideo
# ffmpeg -i $input  -ss $startVideo -t $endVideo -c copy  $output -y
#backup worked
# ffmpeg -ss $startVideo -i $input  -t $endVideo -c:a copy $output -y
# work better and compress very sall
# ffmpeg 
#     \    -y
#     \    -ss $startVideo 
#     \    -i $input  
#     \    -t $endVideo  
#     \    -vcodec libx265 
#     \    -crf 30 
#     \    $output 

# ffmpeg     \
#     -y    \
#     -hide_banner \
#     -ss $startVideo     \
#     -i $input      \
#     -vcodec libx265     \
#     -crf 30     \
#     -b: 500k     \
#     -threads 8 \
#     $output     
#     # -t $endVideo      \
#     # -vsync vfr     \


ffmpeg                              \
    -y                              \
    -ss $startVideo                 \
    -i $input                       \
    -b: 500k                        \
    -threads 8                      \
    -vcodec libstagefright_h264     \
    -crf 26                         \
    -t $endVideo                    \
    $output     

    # --disable-asm    \
    # -vsync vfr     \
    # -preset ultrafast     \

# -i  input file
# -ss start time in seconds or in hh:mm:ss
# -t how time in seconds or in hh:mm:ss
# -to end time in seconds or in hh:mm:ss
# -c codec to use
##

# for remove acc mp licence
# ffmpeg     \
#     -y    \
#     -i $input      \
#     -c:v copy     \
#     $output     


# indevs
# outdevs
# static
# symver

# cross-compile
# gnutls
# gpl
# indev=lavfi
# libass
# libdav1d
# libfreetype
# libmp3lame
# libopus
# libsoxr
# libvidstab
# libvorbis
# libvpx
# libwebp
# libx264
# libx265
# libxvid
# neon
# shared

# --extra-libs=-landroid-glob
# --prefix=/data/data/com.termux/files/usr

# libavutil      56. 51.100 / 56. 51.100
# libavcodec     58. 91.100 / 58. 91.100
# libavformat    58. 45.100 / 58. 45.100
# libavdevice    58. 10.100 / 58. 10.100
# libavfilter     7. 85.100 /  7. 85.100
# libswscale      5.  7.100 /  5.  7.100
# libswresample   3.  7.100 /  3.  7.100
# libpostproc    55.  7.100 / 55.  7.100
