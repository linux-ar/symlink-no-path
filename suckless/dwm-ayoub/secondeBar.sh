#!/bin/bash


kill -9 $(ps -ef|awk  '/ayoubStatusBar/{print $2}'|awk 'NR==1') ; ~/scripts/suckless/dwm-ayoub/ayoubStatusBar.sh "chrono" $1 
