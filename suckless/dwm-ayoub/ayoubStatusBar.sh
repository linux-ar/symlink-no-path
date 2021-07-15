#!/bin/bash

while true;do
  bateryStatus="$(cat /sys/class/power_supply/axp288_fuel_gauge/status)"
  [[ $bateryStatus =~ "Discharging" ]] && bateryFlag="off" || bateryFlag="on"
  battrie="$(cat /sys/class/power_supply/axp288_fuel_gauge/capacity)% ${bateryFlag}"

  date="$(date +%a\ %d\ %b\ %H:%M:%S)"
  ram="$(free -m | awk 'NR==2 { print $3 }') MB"

  [[ ! $(du -b /tmp/chrono|awk '{print $1}') -eq 1 ]] && chrono="| $(cat /tmp/chrono) " || chrono=""

  statusbar="${chrono}| ${battrie} | ${ram} | ${date}" 
  exec xsetroot -name "$statusbar"&
  sleep 1
done
