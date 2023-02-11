#!/bin/bash

#jack_control start
#jack_control ds alsa
#jack_control dps device hw:CARD=Live
#jack_control dps rate 48000
#jack_control dps nperiods 2
#jack_control dps period 256

#alsa_out -c 8 -d hw:CARD=ICUSBAUDIO7D -j usb -n 3 -r 48000 &

#zita-n2j --chan "1, 2" 192.168.5.5 9999 &
#
#pactl load-module module-jack-sink sink_name=p_jack client_name=p_jack channels=2 connect=false
#pactl load-module module-bluez5-device

#jack_connect p_jack:front-left system:playback_1
#jack_connect p_jack:front-right system:playback_2
#jack_connect p_jack:rear-left system:playback_3
#jack_connect p_jack:rear-right system:playback_4
#jack_connect p_jack:front-center system:playback_5
#jack_connect p_jack:lfe system:playback_6
#jack_connect p_jack:side-left system:playback_7
#jack_connect p_jack:side-right system:playback_8

#jack_connect zita-n2j:out_1 system:playback_1
#jack_connect zita-n2j:out_2 system:playback_2
#jack_connect zita-n2j:out_3 system:playback_3
#jack_connect zita-n2j:out_4 system:playback_4
#jack_connect zita-n2j:out_5 system:playback_5
#jack_connect zita-n2j:out_6 system:playback_6
#jack_connect zita-n2j:out_7 system:playback_7
#jack_connect zita-n2j:out_8 system:playback_8

PIPEWIRE_LATENCY="256/48000" nice -11 pw-jack zita-n2j --chan "1, 2" 192.168.5.5 9999 &
PIPEWIRE_LATENCY="256/48000" nice -11 pw-jack carla &

