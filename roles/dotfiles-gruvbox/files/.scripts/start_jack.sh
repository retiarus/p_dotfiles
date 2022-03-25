#!/bin/bash

jack_control start
jack_control ds alsa
jack_control dps device hw:PCH,0
jack_control dps rate 48000
jack_control dps nperiods 2
jack_control dps period 256
#
##alsa_out -c 8 -d hw:CARD=ICUSBAUDIO7D -j usb -n 3 -r 48000 &

zita-n2j --chan "1, 2, 3, 4, 5, 6, 7, 8" 192.168.5.2 9999 &
#
pactl load-module module-jack-sink sink_name=p_jack client_name=p_jack channels=8 connect=false

jack_connect p_jack:front-left system:playback_1
jack_connect p_jack:front-right system:playback_2
jack_connect p_jack:rear-left system:playback_3
jack_connect p_jack:rear-right system:playback_4
jack_connect p_jack:front-center system:playback_5
jack_connect p_jack:lfe system:playback_6
jack_connect p_jack:side-left system:playback_7
jack_connect p_jack:side-right system:playback_8
#jack_connect p_jack:front-left usb:playback_1
#jack_connect p_jack:front-right usb:playback_2
#jack_connect p_jack:rear-left usb:playback_3
#jack_connect p_jack:rear-right usb:playback_4
#jack_connect p_jack:front-center usb:playback_5
#jack_connect p_jack:lfe usb:playback_6
#jack_connect p_jack:side-left usb:playback_7
#jack_connect p_jack:side-right usb:playback_8

jack_connect zita-n2j:out_1 system:playback_1
jack_connect zita-n2j:out_2 system:playback_2
jack_connect zita-n2j:out_3 system:playback_3
jack_connect zita-n2j:out_4 system:playback_4
jack_connect zita-n2j:out_5 system:playback_5
jack_connect zita-n2j:out_6 system:playback_6
jack_connect zita-n2j:out_7 system:playback_7
jack_connect zita-n2j:out_8 system:playback_8

zita-j2n --jname j2n-falco05 --chan 8 192.168.5.5 9999 & 
zita-j2n --jname j2n-sound01 --chan 8 192.168.5.41 9999 &

sleep 1

jack_connect p_jack:front-left    j2n-falco05:in_1 
jack_connect p_jack:front-right   j2n-falco05:in_2 
jack_connect p_jack:rear-left     j2n-falco05:in_3 
jack_connect p_jack:rear-right    j2n-falco05:in_4 
jack_connect p_jack:front-center  j2n-falco05:in_5
jack_connect p_jack:lfe           j2n-falco05:in_6
jack_connect p_jack:side-left     j2n-falco05:in_7
jack_connect p_jack:side-right    j2n-falco05:in_8

jack_connect p_jack:front-left    j2n-sound01:in_1 
jack_connect p_jack:front-right   j2n-sound01:in_2 
jack_connect p_jack:rear-left     j2n-sound01:in_3 
jack_connect p_jack:rear-right    j2n-sound01:in_4 
jack_connect p_jack:front-center  j2n-sound01:in_5
jack_connect p_jack:lfe           j2n-sound01:in_6
jack_connect p_jack:side-left     j2n-sound01:in_7
jack_connect p_jack:side-right    j2n-sound01:in_8
#pactl load-module module-jack-sink
