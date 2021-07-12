#!/bin/bash
i=0
while true;do
  let i=$i+1
  # TODO: make toop for make i-> "...0" ,"..1"
  echo  "${i}" > /tmp/chrono
  sleep 1
done
