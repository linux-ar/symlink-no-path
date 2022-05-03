#!/data/data/com.termux/files/usr/bin/bash
url=$(yt-dlp -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' --youtube-skip-dash-manifest -g $URLP)
video_url=$(echo $url |tr ' ' '\n'|sed -n '1 p')
audio_url=$(echo $url |tr ' ' '\n'|sed -n '2 p')
retard_time=0
rand=$(openssl rand -base64 48 | sed 's/[^a-z]//g'|sed 's/^\(......\).*/\1/')
# rand="${RANDOM:0:6}"
output="/storage/emulated/0/Movies/cut-${rand}.mp4"

echo -e "\n\n  download:${URLP}\n  to:        ${output}\n\n"
# echo "url:$url"
echo "video_url=$video_url"
echo "audio_url=$audio_url"
sleep 3
ffmpeg                              \
    -y                              \
    -ss "${STARTVIDEOP}"            \
    -i  "${video_url}"              \
    -ss "${STARTVIDEOP}"            \
    -i  "${audio_url}"              \
    -map 0:v                        \
    -map 1:a                        \
    -ss "${retard_time}"            \
    -t "${ENDVIDEOP}"              \
    -threads 8                      \
    -crf 18                         \
    -vsync vfr                      \
    -preset ultrafast               \
    "$output" || echo -e "\n\n\nfaild ffmpeg"


touch "$output"

    # -c copy                   \
    # -c:v libx264              \
    # -c:a aac                  \
