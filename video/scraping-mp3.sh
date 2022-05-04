#!/bin/bash

# TODO: make index of loading like 023/081
mkdir -p /data/data/com.termux/files/home/.tmp
echo "" > ~/.data/anghami/url

# trim and filtred
cat ~/.data/anghami/new | awk NF | awk '{$1=$1;print}' | tr ' ' '+' | sort | uniq> ~/.tmp/new
cat ~/.tmp/new  > ~/.data/anghami/new

cat ~/.data/anghami/deja | sort | uniq > ~/.tmp/deja
cat ~/.tmp/deja  > ~/.data/anghami/deja

# avoid old music to redownload
new="$(noduplicate)"
echo "$new"
all=$(echo $new | wc -w)
output="/storage/emulated/0/mp3/new"


getone_url(){
  mesic=$1
  url="https://www.youtube.com/$(curl -s "https://vid.puffyan.us/search?q=${music}" | grep -Eo 'watch\?v=.{11}' | head -n1)" 
  echo $url > ~/.data/anghami/url
}

download_one(){
  url=$(cat ~/.data/anghami/url)
  yt-dlp --audio-quality 5 -x --audio-format mp3 --max-filesize 6m "$url" -o "$output/"'%(title)s.%(ext)s'
}

save_one(){
    echo $1 >> ~/.data/anghami/deja
}

let i=1
for music in $new;do
  echo -e "\n\n$((i++))/${all}: ${music}\n\n"
  getone_url $music && download_one && save_one $music
done
