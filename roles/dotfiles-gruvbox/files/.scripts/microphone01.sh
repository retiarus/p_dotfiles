#!/bin/sh 
ssh peregrinus@microphone01 'tmux new-session -s audio -d; \
                             tmux split-window -h -t audio:0; \
                             tmux split-window -v -t audio:0.0; \
                             tmux split-window -v -t audio:0.2; \
                             tmux send-keys -t audio:0.0 "jackd -R -P89 -ddummy -p256 -P2" Enter; \
                             tmux send-keys -t audio:0.1 "sleep 5; zita-j2n --jname j2n-falco05 --chan 2 192.168.5.5 9999" Enter; \
                             tmux send-keys -t audio:0.2 "sleep 5; zita-a2j -d hw:CARD=seeed4micvoicec -r 48000 -p 256 -n 2 -c 4 -v" Enter; \
                             tmux send-keys -t audio:0.3 "sleep 5; jack_connect zita-a2j:capture_1 j2n-falco05:in_1" Enter; \
                             tmux send-keys -t audio:0.3 "sleep 5; jack_connect zita-a2j:capture_2 j2n-falco05:in_2" Enter; \
                             tmux send-keys -t audio:0.3 "sleep 5; jack_connect zita-a2j:capture_3 j2n-falco05:in_1" Enter; \
                             tmux send-keys -t audio:0.3 "sleep 5; jack_connect zita-a2j:capture_4 j2n-falco05:in_2" Enter;' 




