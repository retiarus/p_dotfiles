#!/bin/sh 

host=`hostname`
tmux new-session -s pmixer -d
tmux send-keys -t pmixer:0 "cd ~" Enter 
tmux send-keys -t pmixer:0 "pulsemixer" Enter 

tmux new-window -t pmixer:1
tmux send-keys -t pmixer:1 "cd ~" Enter
tmux send-keys -t pmixer:1 "~/bin/scripts/start_jack_$host.sh" Enter

tmux attach-session -t pmixer
