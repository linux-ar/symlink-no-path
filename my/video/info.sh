#!/bin/bash
# var
input="$1"


ffprobe -v error -select_streams v:0 -show_entries stream=width,height,r_frame_rate,bit_rate,codec_name,duration -of csv=p=0:s=x $input
