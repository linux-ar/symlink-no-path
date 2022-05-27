#!/bin/bash

new=${1:-app1}
mkdir -p /projects/flutter/$new
if [ ! -f "/projects/flutter/${new}/pubspec.yaml" ] 
then
  cd /projects/flutter/ 
  flutter create $new
  flutter config --enable-linux-desktop
  # rm -rf $new/test/
fi


echo "
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

" > ~/scripts/tmux/${new}.sh
chmod +x ~/scripts/tmux/${new}.sh
# echo "export $new=/projects/flutter/$new" >> $export_Dirs
