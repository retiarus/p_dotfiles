#!/bin/bash

host=`hostname`

declare -A list_options

list_options=(["mqtt"]="mqtt.sh"\
              ["zpmixer"]="sakura zellij -l ~/.config/zellij/layouts/${host}.kdl")

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

echo $options

for option in "${!list_options[@]}"; do echo "$option - ${list_options[$option]}"; done

selected_options=$(echo $options | rofi -sep '|' -dmenu -p -multi-select "option")

echo $selected_options

for option in $selected_options
do
  echo "${list_options[$option]}"
  ${list_options[$option]}
done
