#!/bin/bash

# cd ~/.cache && git clone xlocate.git test
space="                                       "

echo "" > /tmp/tmp1
for file in /root/.cache/test/*;do
  while IFS= read -r line; do
      a=$(echo "${file:18}${space}:" | sed -E 's/^(.{24}).*/\1/')
      echo -e "${a}\t${line}" >> /tmp/tmp1
  done < "$file"
done 
