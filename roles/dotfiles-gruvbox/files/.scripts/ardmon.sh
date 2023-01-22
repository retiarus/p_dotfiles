#!/bin/sh 
tmux new-session -s ardmon -d
tmux split-window -h -t ardmon:0

tmux send-keys -t ardmon:0.0 "cd ~" Enter 
tmux send-keys -t ardmon:0.0 "source ~/.platformio/penv/bin/activate" Enter 
tmux send-keys -t ardmon:0.0 "pio device monitor -b 115200 -p /dev/ttyUSB0" Enter 

tmux send-keys -t ardmon:0.1 "cd ~" Enter 
tmux send-keys -t ardmon:0.1 "source ~/.platformio/penv/bin/activate" Enter 
tmux send-keys -t ardmon:0.1 "pio device monitor -b 115200 -p /dev/ttyACM0" Enter 


tmux attach-session -t ardmon
