#!/bin/bash

host=$1
dir="/usr/sbin"

if [ -x "$(command -v $dir/pm-suspend-hybrid)" ]; then
      	  printf "\n"
	  printf "Suspen-hybrid $host\n"
	  exec ssh peregrinus@$host 'sleep 1; sudo /usr/sbin/pm-suspend-hybrid' &
      
     
else
  printf "Suspend-hybrid não está instalado"
fi
