#!/bin/bash

options="work_room/switch_sound_0"
options="work_room/switch_sound_1|$options"
options="work_room/switch_sound_2|$options"
options="work_room/switch_sound_bed|$options"
options="work_room/switch_sound_all|$options"
options="work_room/switch_light|$options"
options="work_room/switch_light_bed|$options"
options="work_room/switch_light_table|$options"
options="work_room/switch_light_table_2|$options"
options="work_room/switch_light_all|$options"

#options="work_room/rele_bord_0|$options"
#options="work_room/rele_bord_1|$options"

topic=$(echo $options | rofi -sep '|' -dmenu -p -select "topic")
message=$(echo "true|false" | rofi -sep '|' -dmenu -p -select "message")

if [ $topic = "work_room/switch_light_bed" ]; then
  message="1:$message"
  topic=work_room/rele_board_1
fi

if [ $topic = "work_room/switch_sound_bed" ]; then
  message="0:$message"
  topic="work_room/rele_board_1"
fi

if [ $topic = "work_room/switch_sound_2" ]; then
  message="3:$message"
  topic=work_room/rele_board_0
fi

if [ $topic = "work_room/switch_light_table_2" ]; then
  message="2:$message"
  topic=work_room/rele_board_0
fi

if [ $topic = "work_room/switch_sound_all" ]; then
  http POST http://localhost:3333/publish topic=work_room/switch_sound_0 message=$message --print=HBhb
  http POST http://localhost:3333/publish topic=work_room/switch_sound_1 message=$message --print=HBhb
  http POST http://localhost:3333/publish topic=work_room/switch_sound_bed message=$message --print=HBhb

  exit
fi

if [ $topic = "work_room/switch_light_all" ]; then

  # bed
  topic="work_room/rele_board_1"
  http POST http://localhost:3333/publish topic=$topic message="1:$message" --print=HBhb

  # light table
  topic="work_room/switch_light_table"
  http POST http://localhost:3333/publish topic=$topic message=$message --print=HBhb
  
  # light table 2
  topic="work_room/rele_board_0"
  http POST http://localhost:3333/publish topic=$topic message="2:$message" --print=HBhb

  exit
fi


http POST http://localhost:3333/publish topic=$topic message=$message --print=HBhb

