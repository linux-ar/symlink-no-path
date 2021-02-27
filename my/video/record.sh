#!/bin/bash
filename="first.mkv"

ffmpeg \
	-f x11grab \
	-y \
	-i \
	-s $(xdpyinfo | grep dimention | awk '{print $2:}') \
	-f alsa -i default \
	-c:v libx264 -r 30 \
	-c:a flac\
	$filename
