
tmux new-session -s Flutter   -n app9 -d
tmux new-window -t Flutter -d -n debug

tmux send-keys -t Flutter:app9 \
"
cd /projects/flutter/app9
nvim -c 'Telescopefindfiledart'
" \
Enter

tmux send-keys -t Flutter:debug \
"
cd /projects/flutter/app9
flutter run --pid-file /tmp/flutter.pid
" \
Enter

tmux select-window -t Flutter:app9
tmux -u switch -t Flutter


