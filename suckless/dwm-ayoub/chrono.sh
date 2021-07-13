#!/bin/bash
i=0
while true;do
  let i=$i+1
  # TODO: make toop for make i-> "...0" ,"..1"
  # TODO: make min and hour in this loop
  #if [ $i -gt 3600 ] then;
  #ilif 
  # ss=i%3600
  # mm=
  # time="${hh}:${mm}:${ss}"
  echo  "${i}" > /tmp/chrono
  sleep 1
done
