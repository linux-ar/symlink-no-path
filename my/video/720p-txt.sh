#!/bin/bash
`sed -i 's/^.*http/http/' $1`

youtube-dl -f  'bestvideo[height<=480]+bestaudio/best[height<=480]' -o '/storage/emulated/0/Download/yyy/termux-video/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s' -i  -a $1


