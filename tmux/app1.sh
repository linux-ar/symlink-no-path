
tmux new-session -s Flutter   -n app1 -d
tmux new-window -t Flutter -d -n debug

tmux send-keys -t Flutter:app1 \
"
cd /projects/flutter/app1
nvim -c 'Telescopefindfiledart'
" \
Enter

tmux send-keys -t Flutter:debug \
"
cd /projects/flutter/app1
flutter run --pid-file /tmp/flutter.pid
" \
Enter

tmux select-window -t Flutter:app1
tmux -u switch -t Flutter


