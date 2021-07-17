#!/bin/bash
duration=0
# do some work
while true
do
  min="$((duration / 60))"
  sec="$((duration % 60))"
    # echo "--$min:$sec"
  [[ $min -lt 10 ]] && string_min="0$min" || string_min="$min"
  [[ $sec -lt 10 ]] && string_sec="0$sec" || string_sec="$sec"
  echo "$string_min:$string_sec" > /tmp/chrono
  let duration++
  sleep 1
done
