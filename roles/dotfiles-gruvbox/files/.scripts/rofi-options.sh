#!/bin/bash

host=`hostname`

list_options=("sakura zellij -l ~/.config/zellij/layouts/pmixer-{$host}.kdl" \
              "mqtt.sh")

options=""
for item in ${list_options[@]}
do
  options="$options|$item"
done

echo $options

selected_options=$(echo $options | rofi -sep '|' -dmenu -p -multi-select "option")

for option in $selected_options
do 
  $option
done
