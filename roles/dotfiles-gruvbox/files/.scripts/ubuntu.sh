#!/bin/bash

cont="lxc.ubuntu"
option=$1

if [ -x "$(command -v gksudo)" ]; then
  function permition(){
    gksudo $1
  }
else
  function permition(){
    exec xterm -e sudo $1
  }
fi

case "$option" in
  start)
    permition "lxc-start -n $cont -d"
    ;;
  stop)
    permition "lxc-stop -n $cont"
    ;;
  terminal)
    ssh -X peregrinus@192.168.6.2 mate-terminal
    ;;
esac






