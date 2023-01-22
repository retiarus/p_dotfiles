#!/bin/sh 
ssh peregrinus@falco03 'tmux new-session -s video -d; tmux split-window -h -t video:0; tmux send-keys -t video:0 "cd ~" Enter; tmux send-keys -t video:0 "xinit" Enter'





