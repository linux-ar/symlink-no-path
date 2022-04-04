#!/bin/bash

set +x
file="$1"

PWD=$(pwd)
# echo "" nvim --server /root/.cache/nvim/server.pipe --remote-tab "${PWD}/$file"
if [[ -f "$file" && $# == 1 ]];then
  nvim --server /root/.cache/nvim/server.pipe --remote-tab "${PWD}/$file"
else
  echo "not exist"
fi
