#!/bin/bash

##########################################################################################

# Define alguma variáveis básicas

printf "Carregando algumas definições\n"

userresources=$HOME/.Xresources
userdircolorsrc=$HOME/.dircolorsrc
userxinit=$HOME/.xinit

host=$(hostname)

##########################################################################################

# Carrega Xresources

printf "Carregando Xresources\n"

if [ -f "$userresources" ]; then
    xrdb -cpp /usr/bin/cpp -merge "$userresources" &
fi

##########################################################################################

# Carrega cores para ls

printf "Carregando cores para ls\n"

if [ -f "$userdircolorsrc" ]; then
  eval "`dircolors -b $userdircolorsrc`" &
fi

##########################################################################################

# Carrega algumas variáveis básicas

printf "Carregando variáveis de sistema\n"

export DESKTOP_SESSION=gnome
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export QT_SELECT=5
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME="qt5ct"
export GTK_OVERLAY_SCROLLING=0

##########################################################################################

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

##########################################################################################

# Executa scripts no diretório .xinit

printf "Exectando scripts de configuração\n"

for idScript in `ls $userxinit`
do
  if [[ $idScript == *start ]]; then
    printf "Executando script: $idScript\n"
    $userxinit/$idScript &
  fi
done

##########################################################################################

if [ -x "$(command -v xset)" ]; then
  printf "Definindo desligamento automático do monitor\n"
  xset dpms 0 0 300 &
 fi

##########################################################################################

xsetroot -cursor_name left_ptr &
