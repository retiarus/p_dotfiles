#!/bin/bash

host=$(hostname)
dir="/usr/sbin"

listHosts=( falco02 \
  	    falco03 \
	    falco04 \
	    falco05 \
	    falco06 \
	    falco07 )

option=$(zenity --entry --title="machine" --text="maquina a hibernar")

case $option in
  "all")
    if [ -x "$(command -v $dir/pm-suspend-hybrid)" ]
    then
      notify-send --urgency=low -t 3000 "Hibernando o sistema"
      for hostunit in ${listHosts[@]}
      do
	if [[ $hostunit != $host ]]; then
	  printf "\n"
	  printf "Suspen-hybrid $hostunit\n"
	  case "$hostunit" in
	    *)
	      printf "Suspen-hybrid $hostunit\n"
	      exec ssh peregrinus@$hostunit 'sudo /usr/sbin/pm-suspend-hybrid' &
	      ;;
	  esac
	fi
      done
      sleep 1
      exec sudo /usr/sbin/pm-suspend-hybrid &
    else
      printf "Suspend-hybrid não está instalado"
    fi
    ;;
  "falco"*)
    if [ -x "$(command -v $dir/pm-suspend-hybrid)" ]
    then
      notify-send --urgency=low -t 3000 "Hibernando o host $option"
      printf "Suspen-hybrid $option\n"
      exec ssh peregrinus@$option 'sudo /usr/sbin/pm-suspend-hybrid' &
    fi
    ;;
  *)
    ;;
esac
