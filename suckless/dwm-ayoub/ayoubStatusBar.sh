#!/bin/bash

secondeBar=$2
stopwatch(){
  local var=$secondeBar
  # [[ $1 =~ "chrono" ]] && let secondeBar=$secondeBar-1 || let secondeBar=""
  if [ "$1" == "chrono" ] && [ ! -z "$2" ]; then
    secondeBar=33
  fi
  return $var
}
fff(){
while true;do
  date="$(date +%a\ %d\ %b\ %H:%M:%S)"
  ram="$(free -m | awk 'NR==2 { print $3 }')"
  battrie="$(cat /sys/class/power_supply/axp288_fuel_gauge/capacity)"
  statusBatery="$(cat /sys/class/power_supply/axp288_fuel_gauge/status)"
  statusBaterBar="on"
  [[ $statusBatery =~ "Discharging" ]] && statusBaterBar="off"
  statusbarPrimary="${battrie}%$statusBaterBar | ${ram} MB | ${date}" 
  
  secondeBar=$(stopwatch)
  statusbar="$secondeBar | $statusbarPrimary"
  exec xsetroot -name "$statusbar"&
  sleep 1
done
}
stopwatch
echo "$secondeBar"

