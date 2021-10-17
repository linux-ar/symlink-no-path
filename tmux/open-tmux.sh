#!/bin/bash
cd ~
./$(fd --full-path '/root/scripts/my/tmux'| fzf)
