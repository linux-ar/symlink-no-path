
#!/bin/bash

tmux new-session -s Flutter   -n  -d
tmux new-window -t Flutter -d -n debug

tmux send-keys -t Flutter: \
"
cd /projects/flutter/
nvim -c 'Telescopefindfiledart'
" \
Enter

tmux send-keys -t Flutter:debug \
"
cd /projects/flutter/
flutter run --pid-file /tmp/flutter.pid
" \
Enter

tmux select-window -t Flutter:
tmux -u switch -t Flutter


