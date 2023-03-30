~/.xprofile.sh &

list_path=($HOME/.cargo/bin
           $HOME/go/bin \
           $HOME/.local/bin \
           $HOME/bin \
           $HOME/bin/scripts \
           /usr/local/bin)

for i in ${list_path[@]}
do
  if [[ ":$PATH:" != *":$i:"* ]]; then
    export PATH=$i:$PATH
  fi
done

exec awesome

