#!/data/data/com.termux/files/usr/bin/bash
url=$(youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' --youtube-skip-dash-manifest -g $URLP)
video_url=$(echo -e $url |sed -n '1 p')
audio_url=$(echo -e $url |sed -n '2 p')
retard_time=0
rand=$(openssl rand -base64 48 | sed 's/[^a-z]//g'|sed 's/^\(......\).*/\1/')
# because input sometime is string 0:04:30
# if [[ $STARTVIDEOP -gt 30 ]]; then
#     $STARTVIDEOP=$(($STARTVIDEOP-30)) 
#     $ENDVIDEOP=$(($ENDVIDEOP-30))
#     retard_time=30
# fi

ffmpeg                              \
    -y                              \
    -ss "$STARTVIDEOP"              \
    -i  "$video_url"                \
    -ss "$STARTVIDEOP"              \
    -i  "$audio_url"                \
    -map 0:v                        \
    -map 1:a                        \
    -ss "$retard_time"              \
    -t "$ENDVIDEOP"                 \
    -b: 500k                        \
    -threads 8                      \
    -crf 18                         \
    -vsync vfr                      \
    -preset ultrafast               \
    $HOME/storage/movies/vps-output-$rand.mp4

    # -c copy                   \
    # -c:v libx264              \
    # -c:a aac                  \



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
 
# speed but not commress my fideo
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


# ffmpeg                              \
#     -y                              \
#     -ss $startVideo                 \
#     -i $input                       \
#     -b: 500k                        \
#     -threads 8                      \
#     -vcodec libstagefright_h264     \
#     -crf 26                         \
#     -t $endVideo                    \
#     $output     

    # --disable-asm    \
    # -vsync vfr     \
    # -preset ultrafast     \

# -t how time you want
# -to what's time to end

    # -vcodec libstagefright_h264     \
    #
    #
    #
# for remove acc licence
# dont use this flag : -c:a copy
# for fast video only use -c:a copy
# audio must convert automaticaly
# for fast video+audio :
# it's accepte in format that not licended as:
#   - youtube
#   - facebook
# youtube 480p format it's not supported by whatsapp
