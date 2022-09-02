#!/bin/sh 
ssh peregrinus@parrot 'tmux new-session -s video -d; tmux split-window -h -t video:0; tmux send-keys -t video:0 "cd ~" Enter; tmux send-keys -t video:0 "startx" Enter; tmux send-keys -t video:1 "sleep 4" Enter; tmux send-keys -t video:1 "barrierc -f --debug INFO --enable-crypto falco02:24800" Enter'






