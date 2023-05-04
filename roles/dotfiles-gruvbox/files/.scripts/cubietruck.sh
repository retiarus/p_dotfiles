#!/bin/sh 
ssh peregrinus@cubietruck 'tmux new-session -s video -d; tmux split-window -h -t video:0; tmux send-keys -t video:0.0 "cd ~" Enter; tmux send-keys -t video:0.0 "xinit" Enter; tmux send-keys -t video:0.1 "sleep 10" Enter; tmux send-keys -t video:0.1 '"'"'is_running=`pgrep -x barrierc`; [[ $is_running == "" ]] && barrierc -f --debug INFO --enable-crypto falco02:24800'"'"' Enter'






