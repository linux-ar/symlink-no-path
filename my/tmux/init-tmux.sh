echo "
#!/bin/bash

tmux new-session -s Flutter   -n $new -d
tmux new-window -t Flutter -d -n debug

tmux send-keys -t Flutter:$new \\
\"
cd /projects/flutter/$new
nvim -c 'Telescopefindfiledart'
\" \\
Enter

tmux send-keys -t Flutter:debug \\
\"
cd /projects/flutter/$new
flutter run --pid-file /tmp/flutter.pid
\" \\
Enter

tmux select-window -t Flutter:$new
tmux -u switch -t Flutter

" > ~/scripts/my/tmux/${new}.sh
