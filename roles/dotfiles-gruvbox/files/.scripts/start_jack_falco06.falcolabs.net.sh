#!/bin/bash

#jack_control start
#jack_control ds alsa
#jack_control dps device hw:CARD=PCH
#jack_control dps rate 48000
#jack_control dps nperiods 2
#jack_control dps period 256

sleep 2

pactl load-module module-null-sink media.class=Audio/Duplex sink_name=default audio.position=FL,FR,RL,RR

sleep 2

pw-jack zita-j2n --chan 2 --ipv4 falco05 9996 --jname zita-j2n-falco05 &
pw-jack zita-j2n --chan 2 --ipv4 sound01 9996 --jname zita-j2n-sound01 &
pw-jack zita-j2n --chan 2 --ipv4 falco02 9996 --jname zita-j2n-falco02 &

pw-jack zita-n2j --jname n2j-9999 --chan 1,2 192.168.5.6 9999 &

sleep 2

pw-jack carla ~/carla-mixer-falco06.carxp &

#pactl load-module module-jack-sink sink_name=p_jack client_name=p_jack channels=4 connect=false

#jack_connect p_jack_sink:front-left system:playback_1
#jack_connect p_jack_sink:front-right system:playback_2
