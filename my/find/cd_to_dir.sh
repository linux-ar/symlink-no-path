#!/bin/bash

# cd to folder by name of files

cdf() {
 # pushd $(dirname $(fzf)) && \
 pushd $(dirname $(fid --type f --hidden --follow --exclude ".git" --exclude "dotfiles")) && \
   clear                 && \
   echo -e "\n\n"        && \
   $PREFIX/bin/exa       && \
   echo -e "\n\n"
}

cdd() {
 export FZF_DEFAULT_OPTS='--height=95% '
 cd                                 \
    fd --type d                     \
       --hidden                     \
       --follow                     \
       --exclude "dotfiles"         \
       --exclude ".git"             \
       --exclude ".npm"             \
       --exclude ".cache" . | fzf   \
        &&\
  $PREFIX/bin/exa && \
  echo -e "\n"
 export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
}

cff() {
 export FZF_DEFAULT_OPTS='--height=95% '
 pushd $(dirname $(fd --type f          \
       --hidden                         \
       --follow                         \
       --exclude "dotfiles"             \
       --exclude ".git"                 \
       --exclude ".npm"                 \
       --exclude ".cache" . | fzf ))
  clear
  $PREFIX/bin/exa 
  printf "\033[1;4;35m%-${COLUMNS}s\033[00m"
  echo " "
 export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
}
