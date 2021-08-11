#!/bin/bash
new=$1
mkdir -p /projects/flutter/$new
if [ ! -f "/projects/flutter/${new}/pubspec.yaml" ] 
then
  cd /projects/flutter/ 
  flutter create $new
  flutter config --enable-linux-desktop
fi

echo "
#!/bin/bash

tmux new-session -s Flutter   -n $new -d
tmux new-window -t Flutter -d -n nvim_config
# tmux new-window -t Flutter -d -n debug
tmux new-window -t Flutter -d -n terminal

tmux send-keys -t Flutter:$new        \"cd /projects/flutter/$new;nvim lib/main.dart\"     Enter
tmux send-keys -t Flutter:nvim_config \"cd $nvimdir;nvim lua/nvPlugins/packerPlugins.lua\" Enter
# tmux send-keys -t Flutter:debug       \"cd /projects/flutter/$new;flutter run\"            Enter
tmux send-keys -t Flutter:terminal    \"cd /projects/flutter/$new\"                        Enter

tmux select-window -t Flutter:$new
tmux -u attach -t Flutter

" > ~/scripts/my/tmux/${new}.sh
chmod +x ~/scripts/my/tmux/${new}.sh
echo "export $new=/projects/flutter/$new" >> $export_Dirs
