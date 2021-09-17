#!/bin/bash

# cd to folder by name of files


cptodir() {
  tmp=FZF_DEFAULT_OPTS
  fromdir="$1"
  todir="$2"
  export FZF_DEFAULT_OPTS='--height=95% '
  #TODO: if fromdir/todir not started with / or $ 
  #      use fromdir=`pwd`$fromdir
  #TODO: if dir nt exect , goto else
  if [ "$#" -eq 2 ];
  then
    from=$(fd --type f                    \
             --hidden                     \
             --follow                     \
             --exclude ".dotfiles"        \
             --exclude ".debris"          \
             --exclude ".git"             \
             --exclude ".npm"             \
             --exclude ".cache" . "$fromdir" |fzf)
    sleep 0.5
    to=$(fd  --type d                    \
             --hidden                     \
             --follow                     \
             --exclude ".dotfiles"        \
             --exclude ".var"          \
             --exclude ".dropbox"          \
             --exclude ".debris"          \
             --exclude ".git"             \
             --exclude ".npm"             \
             --exclude ".cache" . "$todir" |fzf)
    # clear
    # printf "\033[1;4;35m%-${COLUMNS}s\033[00m"
    # echo "from=\"$from\""
    # echo "to=\"$to\""
    cp $from $to
  elif [ "$#" -eq 1 ];
  then
    from=$(fd --type f                    \
             --hidden                     \
             --follow                     \
             --exclude ".dotfiles"        \
             --exclude ".debris"          \
             --exclude ".git"             \
             --exclude ".npm"             \
             --exclude ".cache" . "$fromdir" |fzf)
    cp $from `pwd`
  else
    echo "\n\tnumbre of arge not equal tow\n"
  fi
  export FZF_DEFAULT_OPTS=tmp
}
