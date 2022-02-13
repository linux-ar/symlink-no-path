#!/bin/bash

file="$(fzf)"
if [[ "$file" == *mpv || "$file" == *webm ]]; then
  echo $file
  mpv "$file" >/dev/null 2>&1 &!
else 
  echo "not mustch $file"
fi
