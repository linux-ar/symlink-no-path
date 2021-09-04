
#!/bin/bash

tmux new-session -s Flutter   -n animation1 -d
tmux new-window -t Flutter -d -n debug

tmux send-keys -t Flutter:animation1 \
"
cd /projects/flutter/animation1
nvim -c 'Telescopefindfiledart'
" \
# Enter

 tmux send-keys -t Flutter:debug \
"
cd /projects/flutter/animation1
flutter run --pid-file /tmp/flutter.pid" 

tmux select-window -t Flutter:animation1
tmux -u switch -t Flutter


