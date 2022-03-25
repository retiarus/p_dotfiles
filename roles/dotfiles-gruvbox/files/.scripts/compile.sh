number=$(wc -l world.deep | awk '{print $1}') 
count=1 
for unit in `cat world.deep`; do 
printf "\e[31m Install \e[32m$count:\e[35m$number - \e[36\e[36m$unit\n"  
count=$((count+1))
emerge --nodeps --oneshot --root=/mnt/falco --root-config "=$unit" 2>/dev/null
done
