#!/bin/bash

jack_control start
jack_control ds alsa
jack_control dps device hw:CARD=PCH
jack_control dps rate 48000
jack_control dps nperiods 2
jack_control dps period 512

sleep 2

zita-j2n --chan 2 --ipv4 falco05 9999 --jname zita-j2n-falco05 &
zita-j2n --chan 2 --ipv4 sound01 9999 --jname zita-j2n-sound01 &
zita-j2n --chan 2 --ipv4 falco02 9999 --jname zita-j2n-falco02 &

sleep 2

carla ~/carla-mixer-falco06.carxp &

#pactl load-module module-jack-sink sink_name=p_jack client_name=p_jack channels=4 connect=false

#jack_connect p_jack_sink:front-left system:playback_1
#jack_connect p_jack_sink:front-right system:playback_2
