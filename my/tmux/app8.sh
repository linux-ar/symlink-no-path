
#!/bin/bash

tmux new-session -s Flutter   -n app8 -d
# tmux new-window -t Flutter -d -n nvim_config
tmux new-window -t Flutter -d -n debug
# tmux new-window -t Flutter -d -n terminal

tmux                             \
  send-keys -t Flutter:app8      \
"
cd /projects/flutter/app8
nvim
"                                \
Enter


# tmux send-keys -t Flutter:nvim_config "cd /root/.config/nvim;nvim lua/nvPlugins/packerPlugins.lua" Enter
tmux                               \
  send-keys -t Flutter:debug       \
"
cd /projects/flutter/app8
#flutter run --pid-file /tmp/flutter.pid
"                                  \
Enter


# tmux send-keys -t Flutter:terminal    "cd /projects/flutter/app8"                        Enter

tmux select-window -t Flutter:app8
tmux -u switch -t Flutter
