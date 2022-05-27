
tmux new-session -s Flutter   -n app8 -d
tmux new-window -t Flutter -d -n debug

tmux send-keys -t Flutter:app8 \
"
cd /projects/flutter/app8
nvim -c 'Telescopefindfiledart'
" \
Enter

tmux send-keys -t Flutter:debug \
"
cd /projects/flutter/app8
flutter run --pid-file /tmp/flutter.pid
" \
Enter

tmux select-window -t Flutter:app8
tmux -u switch -t Flutter


