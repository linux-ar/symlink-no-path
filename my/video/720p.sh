#!/bin/bash
input=`echo "$1" | sed 's/^.*http/http/'`

youtube-dl -f 'bestvideo[height<=720]+bestaudio/best[height<=720]' -o '/storage/emulated/0/Download/yyy/termux-video/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'  $input


