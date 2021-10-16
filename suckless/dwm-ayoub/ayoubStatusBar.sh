#!/bin/bash
# use sxhkd to enable/disable transtale
# TODO: make as a function
function transtale() {
	:
}

while true; do
	bateryStatus="$(cat /sys/class/power_supply/axp288_fuel_gauge/status)"
	[[ $bateryStatus =~ "Discharging" ]] && bateryFlag="y" || bateryFlag="n"
	battrie="$(cat /sys/class/power_supply/axp288_fuel_gauge/capacity)% ${bateryFlag}"
	# learn="  $(shuf -n 1 /mega/repo/wiki/learn.txt)  "

	date="$(date +%a\ %d\ %b\ %H:%M:%S)"
	ram="$(free -m | awk 'NR==2 { print $2-$7 }') MB"

	[[ ! $(du -b /tmp/chrono | awk '{print $1}') -eq 1 ]] && chrono="\x03 $(cat /tmp/chrono) \x01" || chrono=""

	statusbar="${chrono}${battrie} | ${ram} | ${date}"
	exec xsetroot -name "$(echo -e $statusbar)" &

	# clip grep content from clipbroad
	clip="$(xclip -o -sel clip | tr '\n' ' ')"
	cliptxt="$(cat /tmp/cliptxt)"
	is_crow="$(cat /tmp/iscro)"
	is_sh="$(cat /tmp/istrash)"

	# - keep only arabic text
	# - when google block multi connexion for some time , don't use translate.sh
	# -  TODO: make a timer then use crow again

  echo "clip= $clip"
  echo "cliptxt= $cliptxt"
  echo "is_crow= $is_crow"
  echo "is_sh= $is_sh"

	if [[ $clip != $cliptxt  ]]; then
    sleep 3
    # on use cat file to check if already google-no-reponse
    # then on use is_error to cheack this tentative it's work or not
    if [[  $is_crow != "Error" ]]; then
      tra="$(crow -t ar $clip)"
      n="$(echo "$tra" | wc -l)" 
      tra=$(echo "$tra" | head -n $((n - 1)) | tail -n $((n - 5))) 
      tra=$(echo $tra | tr '\n' ' ') 
      is_error=$(sed 's/^.\(.....\).*/\1/' <<< "$tra" ) 
      if [[  $is_crow != "Error" ]]; then
        echo "$tra"  > /tmp/chrono
        echo "$clip" > /tmp/cliptxt
      else
        echo "EXPECTED" > /tmp/iscro
      fi
    elif [[ $is_sh != "EXPECTED" ]]; then
      tra="$(translate.sh auto ar $clip)"
      tra=$(echo $tra | tr '\n' ' ') 
      is_error=$(sed 's/^.\(.......\).*/\1/' <<< "$tra" ) 
      if [[  $is_crow != "EXPECTED" ]]; then
        echo "$tra"  > /tmp/chrono
        echo "$clip" > /tmp/cliptxt
      else
        echo "EXPECTED" > /tmp/istrash
      fi
    fi
  fi
  sleep 1
done
