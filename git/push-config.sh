#!/bin/bash

cgit="/usr/bin/git             \
      --git-dir=$HOME/dotfiles \
      --work-tree=$HOME"

$cgit status  
$cgit add -u 
$cgit status
$cgit commit -m "$1"
$cgit push

$_isAlias______ && . $file_alias____

