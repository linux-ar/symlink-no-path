
#!/bin/bash

tmux new-session -s Flutter   -n app6 -d
tmux new-window -t Flutter -d -n nvim_config
tmux new-window -t Flutter -d -n debug
tmux new-window -t Flutter -d -n terminal

tmux send-keys -t Flutter:app6        "cd /projects/flutter/app6;nvim lib/main.dart"     Enter
tmux send-keys -t Flutter:nvim_config "cd /root/.config/nvim;nvim lua/nvPlugins/packerPlugins.lua" Enter
tmux send-keys -t Flutter:debug       "cd /projects/flutter/app6;flutter run"            Enter
tmux send-keys -t Flutter:terminal    "cd /projects/flutter/app6"                        Enter

tmux select-window -t Flutter:app6
tmux -u attach -t Flutter


