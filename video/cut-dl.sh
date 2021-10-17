#!/bin/bash
# https://youtu.be/mQal3i1rPm4
# var
url="$1"
startVideo="$2"
endVideo="$3"

youtube-dl --postprocessor-args "-ss $startVideo -to $endVideo" $url
