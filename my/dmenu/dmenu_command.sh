#!/bin/sh
word=$(echo " "|dmenu -p "run app: ")
bash -c "$word" 
