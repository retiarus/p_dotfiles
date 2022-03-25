#!/bin/bash

case $1 in
  "-h" | "--help")
    printf "Este script deve ser utilizado conforme o exemplo:\n"
    printf "syncDotFiles <dir-origem> <dir-destino> \"argumentos adicionais para a sincronização\"\n"
    printf "Exemplo de dir-origem:/home/peregrinus/\n"
    printf "Exemplo de dir-destino:falco03:/home/peregrinus/ \n"
    ;;
  *)
    homeorig=$1
    homedest=$2

    rsync -aAXHivurh --progress --rsh=ssh --files-from="$HOME/scripts/basic-files-list.txt" \
      $homeorig/ $homedest/ $3
    ;;
esac




