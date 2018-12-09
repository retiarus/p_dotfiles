#!/bin/sh

##########################################################################################

# Define alguma variáveis básicas

printf "Carregando algumas definições\n"

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
userxkbmap=$HOME/.Xkbmap
userdircolorsrc=$HOME/.dircolorsrc
userxinit=$HOME/.xinit
userwmlib=$HOME/lib

host=$(hostname)

listPro=( /usr/bin/start-pulseaudio-x11 \
  /usr/bin/mate-volume-control-applet \
  /usr/bin/mate-power-manager \
  /usr/bin/system-config-printer-applet \
  /usr/lib/mate-user-share/mate-user-share \
  /usr/bin/mate-screensaver \
  /usr/bin/nm-applet \
  /usr/bin/parcellite \
  /usr/bin/blueman-applet \
  /usr/bin/remmina \
  /opt/bin/dropbox \
  /usr/bin/guake \
  /usr/bin/tilda -h \
  /usr/bin/uget )

##########################################################################################

# Carrega Xresources

printf "Carregando Xresources\n"

if [ -f "$userresources" ]; then
    xrdb -cpp /usr/bin/cpp -merge "$userresources"
fi

##########################################################################################

# Carrega Xkmap

printf "Definindo mapa de teclado\n"

if [ -f "$userxkbmap" ]; then
    setxkbmap `cat "$userxkbmap"`
    XKB_IN_USE=yes
fi

##########################################################################################

# Carrega cores para ls

printf "Carregando cores para ls\n"

if [ -f "$userdircolorsrc" ]; then
  eval "`dircolors -b $userdircolorsrc`"
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
export PATH=$HOME/bin:/usr/local/bin:$PATH

##########################################################################################

# Executa scripts no diretório .xinit

printf "Exectando scripts de configuração\n"

for idScript in `ls $userxinit`
do
  if [[ $idScript == *start ]]; then
    printf "Executando script: $idScript\n"
    $userxinit/$idScript
  fi
done

##########################################################################################

# Carrega modulo de audio combine pulse-audio

if [ -x "$(command -v pactl)" ]; then
  if [ -f "/usr/lib/pulse/modules/module-combine.so" ]; then
    printf "Carregando modulo de som combine\n"
    pactl load-module module-combine
  else
    printf "O modulo combine não está disponível\n"
  fi
else
  printf "O comando pactl não está disponível\n"
fi


##########################################################################################

# Carrega o polkit adequado ao sistema

if [[ $(uname -a | grep "debian") == *debian* ]]; then
  if [[ $(uname -r | grep "amd64") == *amd64* ]]; then
  	/usr/lib/x86_64-linux-gnu/polkit-mate/polkit-mate-authentication-agent-1 2>/dev/null &
  fi
fi

if [[ $(uname -a | grep "debian") == *debian* ]]; then
  if [[ $(uname -r | grep "686") == *686* ]]; then
  	/usr/lib/i386-linux-gnu/polkit-mate/polkit-mate-authentication-agent-1 2>/dev/null &
       echo "OI"
  fi
fi

##########################################################################################

# Carrega gnome-keyring-daemon

if [ -x "$(command -v gnome-keyring-daemon)" ]; then
  printf "Carregando gnome-keyring-daemon\n"
  /usr/bin/gnome-keyring-daemon --start --components=ssh
  /usr/bin/gnome-keyring-daemon --start --components=gpg
  /usr/bin/gnome-keyring-daemon --start --components=pkcs11
  /usr/bin/gnome-keyring-daemon --start --components=secrets
else
  printf "gnome-keyring-daemon não está instalado\n"
fi


##########################################################################################

# Executa cada elemento do array listPro

for pro in ${listPro[@]}
do
  if [ -x "$(command -v $pro)" ]; then
    printf "$pro está instalado\n"
    printf "Executando $pro\n"
    $pro &

  else
    printf "$pro não está instalado\n"
  fi
done

##########################################################################################

if [ -x "$(command -v xset)" ]; then
  printf "Definindo desligamento automático do monitor\n"
  xset dpms 0 0 300
fi

##########################################################################################

xsetroot -cursor_name left_ptr
