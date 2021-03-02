#!/bin/bash
url=$(youtube-dl --youtube-skip-dash-manifest -g $URLP)
video_url=$(echo -e $url |sed -n '1 p')
audio_url=$(echo -e $url |sed -n '2 p')
retard_time=0
if [[ $STARTVIDEOP -gt 30 ]]; then
    $STARTVIDEOP=$(($STARTVIDEOP-30)) 
    $ENDVIDEOP=$(($ENDVIDEOP-30))
    retard_time=30
fi

ffmpeg                        \
    -y                        \
    -ss "$STARTVIDEOP"        \
    -i  "$video_url"          \
    -ss "$STARTVIDEOP"        \
    -i  "$audio_url"          \
    -map 0:v                  \
    -map 1:a                  \
    -ss "$retard_time"        \
    -t "$ENDVIDEOP"           \
    -c:v libx264              \
    -c:a aac                  \
    $HOME/storage/movies/vps-output.mp4



 # ffmpeg
 #    -ss 2:30
 #    -i "$video_url"
 #    -ss 2:30
 #    -i "$audio_url"
 #    -map 0:v
 #    -map 1:a
 #    -ss 30
 #    -t 1:10
 #    -c:v libx264
 #    -c:a aac gog-vs-triv.mkv
