#!/bin/sh 
tmux new-session -s mqtt -d
tmux split-window -h -t mqtt:0
tmux split-window -v -t mqtt:0.0
tmux send-keys -t mqtt:0.0 "cd ~/experimentos/nodejs/mqtt" Enter 
tmux send-keys -t mqtt:0.0 "yarn start" Enter 

tmux send-keys -t mqtt:0.1 "ssh peregrinus@mizumi01" Enter 
tmux send-keys -t mqtt:0.1 "sudo docker container logs -f -n 20 mosquitto" Enter 

tmux send-keys -t mqtt:0.2 "cd ~/bin" Enter 
tmux send-keys -t mqtt:0.2 "./insomnia" Enter 

#tmux new-window -t mqtt:1
#tmux send-keys -t mqtt:1.0 "cd ~/bin//scripts" Enter 
#tmux send-keys -t mqtt:1.0 "./start_jack.sh" Enter 
#
#tmux new-window -t mqtt:2
#tmux send-keys -t mqtt:2.0 "cd ~" Enter 
#tmux send-keys -t mqtt:2.0 "pulsemixer" Enter 

tmux attach-session -t mqtt
