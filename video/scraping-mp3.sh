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
output="/storage/emulated/0/mp3"
mkdir "$output/dup3" -p
music=""


getone_url(){
  mesic=$1
  url="https://www.youtube.com/$(curl -s "https://vid.puffyan.us/search?q=${music}" | grep -Eo 'watch\?v=.{11}' | head -n1)" 
  echo $url > ~/.data/anghami/url
}

download_one(){
  url="$(cat ~/.data/anghami/url)"
  music="$(yt-dlp  "$url" --get-title)"
  music="$(echo $music | sed 's#\W#_#g')"
  dupmusic=""
  for i in {1..2};do
    dupmusic+="${music}.mp3|"
  done
  dupmusic+="${music}.mp3"
  pushd "$output"
  echo "$dupmusic"
  yt-dlp --audio-quality 5 -x --audio-format mp3 --max-filesize 6m "$url" -o "$output/${music}.mp3" &&
  ffmpeg -i "concat:${dupmusic}" -acodec copy "${output}/dup3/${music}.mp3" -y
  popd
}

save_one(){
    echo $1 >> ~/.data/anghami/deja
    # echo "uncppmen save_one"
}


i=0
for music in $new;do
  let "i++"
  echo -e "\n\n$((i++))/${all}: ${music}\n\n"
  getone_url $music &&
  download_one &&
  save_one $music
done
