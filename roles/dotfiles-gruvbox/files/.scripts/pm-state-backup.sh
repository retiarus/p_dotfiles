#!/bin/bash

host=$(hostname)
dir="/usr/sbin"

if [ -x "$(command -v $dir/pm-suspend-hybrid)" ]; then
  case "$host" in
    falco02)
      for hostunit in 'falco02' 'falco03' 'falco04' 'falco05'
      do
	if [[ $hostunit != $host ]]; then
	  printf "\n"
	  printf "Suspen-hybrid $hostunit\n"
	  exec ssh peregrinus@$hostunit 'sleep 1; sudo /usr/sbin/pm-suspend-hybrid' &
	fi
      done
      ;;
    *)
      for hostunit in 'falco02' 'falco03' 'falco04' 'falco05'
      do
	if [[ $hostunit != $host ]]; then
	  printf "\n"
	  printf "Suspen-hybrid $hostunit\n"
	  exec ssh peregrinus@$hostunit 'sudo /usr/sbin/pm-suspend-hybrid' &
	fi
      done
      ;;
  esac

  sleep 1
  exec sudo /usr/sbin/pm-suspend-hybrid &

else
  printf "Suspend-hybrid não está instalado"
fi
