#!/bin/bash

/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME status         
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME add -u         
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME status         
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME commit -m "$1" 
/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME push           
source $HOME/.alias
