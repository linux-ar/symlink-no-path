#!/bin/bash

# TODO: make index of loading like 023/081
mkdir -p /data/data/com.termux/files/home/.tmp
echo "" > ~/.data/anghami/url

# trim and filtred
cat ~/.data/anghami/new | awk NF | awk '{$1=$1;print}' | tr ' ' '+' |tr '/' '+'| sort | uniq> ~/.tmp/new
cat ~/.tmp/new  > ~/.data/anghami/new

cat ~/.data/anghami/deja | sort | uniq > ~/.tmp/deja
cat ~/.tmp/deja  > ~/.data/anghami/deja

# avoid old music to redownload
new="$(noduplicate)"
echo "$new"
all=$(echo $new | wc -w)
output="/storage/emulated/0/mp3"
mkdir "$output/dup3" -p
music=""
title=""


getone_url(){
  mesic=$1
  url="https://www.youtube.com/$(curl -s "https://vid.puffyan.us/search?q=${music}" | grep -Eo 'watch\?v=.{11}' | head -n1)" 
  echo $url > ~/.data/anghami/url
}

download_one(){
  clear
  url="$(cat ~/.data/anghami/url)"
  title="$(yt-dlp  "$url" --get-title)"
  title="$(echo $title| tr ' ' '+'|tr '/' '+'| tr '(' '+')| tr ')' '+'"
  echo -e "\n\n-----\nurl=$url\ntitle=$title\n-----\n"
  # title="$(echo $music | sed 's#\W#_#g')"
  dupmusic=""
  for i in {1..2};do
    dupmusic+="${title}.mp3|"
  done
  dupmusic+="${title}.mp3"
  pushd "$output"
  echo -e "\n\n-----\ndupmusic=$dupmusic\npath=$output\n-----\n"
  echo yt-dlp --audio-quality 5 -x --audio-format mp3 --max-filesize 6m "$url" -o "$output/${title}.mp3"
  yt-dlp --audio-quality 5 -x --audio-format mp3 --max-filesize 6m "$url" -o "$output/${title}.mp3" &&
  ffmpeg -i "concat:${dupmusic}" -acodec copy "${output}/dup3/${title}.mp3" -y
  sleep 5
  popd
}

save_one(){
    echo ${music} >> ~/.data/anghami/deja
    # echo "uncppmen save_one"
}


i=0
for music in $new;do
  let "i++"
  echo -e "\n\n$((i++))/${all}: ${music}\n\n"
  getone_url $music &&
  download_one &&
  save_one 
done
