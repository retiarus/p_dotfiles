#!/bin/bash

host=$(hostname)

listHosts=( falco02 \
  	    falco03 \
	    falco04 \
	    falco05 \
	    falco06 \
	    falco07 \
	    cubietruck )

for hostUnit in ${listHosts[@]}
do
  if [[ $hostUnit != $host ]]; then 
    printf "\n"
    printf "Sync $hostUnit\n" 
    syncDotFiles.sh $HOME $hostUnit.falco.net:$HOME $2
  fi
done
