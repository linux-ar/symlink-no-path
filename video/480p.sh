#!/bin/bash
input=`echo "$1" | sed 's/^.*http/http/'`

youtube-dl -f 'bestvideo[height<=480]+bestaudio/best[height<=480]' -o '/storage/emulated/0/Download/yyy/termux-video/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'  $input


