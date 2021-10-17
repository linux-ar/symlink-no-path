tmux new-session -s Flutter -n app5 -d
tmux new-window -t Flutter -d -n nvim_config
tmux new-window -t Flutter -d -n debug

tmux send-keys -t Flutter:app5 "cd $app5;nvim lib/main.dart" Enter
tmux send-keys -t Flutter:debug "cd $app5;flutter run" Enter
tmux send-keys -t Flutter:nvim_config "cd $nvimdir;nvim lua/nvPlugins/packerPlugins.lua" Enter

tmux select-window -t Flutter:app5
tmux -u attach -t Flutter

