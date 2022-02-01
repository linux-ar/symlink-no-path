#!/bin/bash

echo "" > /data/anghami/url

# trim and filtred
cat /data/anghami/new | awk NF | awk '{$1=$1;print}' | tr ' ' '+' | sort | uniq> /tmp/new
cat /tmp/new  > /data/anghami/new

cat /data/anghami/deja | sort | uniq > /tmp/deja
cat /tmp/deja  > /data/anghami/deja

# avoid old music to redownload
new="$(noduplicate)"
output="~/Videos/mp3"


getone_url(){
  mesic=$1
  url="https://www.youtube.com/$(curl -s "https://vid.puffyan.us/search?q=${music}" | grep -Eo 'watch\?v=.{11}' | head -n1)" 
  echo $url > /data/anghami/url
}

download_one(){
  url=$(cat /data/anghami/url)
  yt-dlp -f 'ba' -x --audio-format mp3 "$url" -o "$output/"'%(title)s.%(ext)s'
}

save_one(){
    echo $1 >> /data/anghami/deja
}

for music in $new;do
  echo $music
  getone_url $music && download_one && save_one $music
done



