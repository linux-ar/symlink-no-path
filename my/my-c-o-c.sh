#!/bin/bash
  pacman -S nodejs
  pacman -S python-pip
  pacman -S ripgrep fzf ranger

  pip install pynvim --user
  pip install neovim-remote
  pip install ueberzug

  mkdir -p ~/.config/coc/extensions
  cd ~/.config/coc/extensions
  [ ! -f package.json ] && echo '{"dependencies":{}}'> package.json
  sudo npm install coc-explorer coc-snippets coc-json coc-actions --global-style --ignore-scripts --no-bin-links --no-package-lock --only=prod






