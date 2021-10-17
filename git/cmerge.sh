#!/bin/bash
branch="$1"
cgit="/usr/bin/git             \
      --git-dir=$HOME/dotfiles \
      --work-tree=$HOME"

$cgit update-index --assume-unchanged $HOME/.zsh_history
$cgit update-index --assume-unchanged $HOME/.local/share/nvim/shada/main.shada

set -e
if [[ -n "branch" ]]; then
     ${cgit} checkout master
     ${cgit} pull origin master
     ${cgit} merge $branch
     ${cgit} push origin master
     ${cgit} commit -m "update history"
fi


  set +e
  ${cgit} update-index --no-assume-unchanged $HOME/.local/share/nvim/shada/main.shada
  ${cgit} update-index --no-assume-unchanged $HOME/.zsh_history

#***#  ${cgit} push origin master

echo -e "\n\n\t\tyyyy"
