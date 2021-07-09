#!/bin/bash

while true;do
  date="$(date +%a\ %d\ %b\ %H:%M:%S)"
  ram="$(free -m | awk 'NR==2 { print $3 }')"
  battrie="$(cat /sys/class/power_supply/axp288_fuel_gauge/capacity)"
  statusBatery="$(cat /sys/class/power_supply/axp288_fuel_gauge/status)"
  statusBaterBar="on"
  [[ $statusBatery =~ "Discharging" ]] && statusBaterBar="off"
  statusbarPrimary="${battrie}%$statusBaterBar | ${ram} MB | ${date}" 
  
  statusbar="$secondeBar | $statusbarPrimary"
  exec xsetroot -name "$statusbar"&
  sleep 1
done
