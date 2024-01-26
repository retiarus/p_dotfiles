#!/bin/bash

host=`hostname`

declare -A list_options

list_options=(["mqtt"]="mqtt.sh"\
              ["zpmixer"]="pmixer.sh")

options=""
for item in "${!list_options[@]}"
do
  if [ -z "$options" ]
  then
    options="$item"
  else
  options="$options|$item"
  fi  
done

for option in "${!list_options[@]}"; do echo "$option - ${list_options[$option]}"; done

selected_options=$(echo $options | rofi -sep '|' -dmenu -p -multi-select "option")

for option in $selected_options
do
  ${list_options[$option]}
done
