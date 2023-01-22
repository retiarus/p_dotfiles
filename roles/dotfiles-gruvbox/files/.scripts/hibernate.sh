#!/bin/bash

hosts=$(echo "falco02|falco03|falco04|falco05|falco06|parrot|deepserver01" | rofi -sep '|' -dmenu -p -multi-select "host")

for host in $hosts
do 
  ssh peregrinus@$host "sudo systemctl hibernate"
done
