#!/bin/bash

case $1 in
  "-h" | "--help")
    printf "Este script deve ser utilizado conforme o exemplo:\n"
    printf "syncConfig <host:directory> \"argumentos adicionais para a sincronização\"\n"
    printf "Exemplo de host falco03.\n"
    printf "Exemplo de argumento adicional -n \n"
    ;;
  *)
    homedest=$1

    rsync -aAXHhivurh --progress --rsh=ssh --rsync-path="sudo rsync" \
      --files-from="$HOME/scripts/basic-files-list-config.txt" \
      / $homedest $2
    ;;
esac





