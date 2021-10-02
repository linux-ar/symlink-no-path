#!/bin/bash


# TODO: make : 
# - nvim2 => $nvimdir
# - packerdir2 => $packerdir   
if [[ "$#" == 1 && -d "/root/.cache/symlink/${1}" ]]; then
  rm -rf $nvimdir > /dev/null
  rm -rf $packerdir/start >/dev/null
  rm -rf $packerdir/opt >/dev/null
  rm -rf /root/.cache/nvim >/dev/null
  
  mkdir -p "/root/.cache/symlink/${1}/nvim"
  mkdir -p "/root/.cache/symlink/${1}/start"
  mkdir -p "/root/.cache/symlink/${1}/opt"
  mkdir -p "/root/.cache/symlink/${1}/cache"

  new_nvim="/root/.cache/symlink/${1}/nvim"
  new_packer_start="/root/.cache/symlink/${1}/start"
  new_packer_opt="/root/.cache/symlink/${1}/opt"
  new_cache="/root/.cache/symlink/${1}/cache"
  
  ln -s $new_nvim $nvimdir
  ln -s $new_packer_start /root/.local/share/nvim/site/pack/packer/start
  ln -s $new_packer_opt /root/.local/share/nvim/site/pack/packer/opt
  ln -s $new_cache /root/.cache/nvim
fi
