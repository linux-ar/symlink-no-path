#!/bin/sh
word=$(echo ""|dmenu -p "ADD word: ")
meaning=$(echo ""|dmenu -p "ADD Meaning: ")
#TODO: if word or meaning is empty not save to file
echo "$word | $meaning" >> $wiki/learn.txt
