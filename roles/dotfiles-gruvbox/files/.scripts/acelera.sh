#!/bin/bash

# Script Acelerador de Computador.
# Carrega  os pacotes Verynice e Preload,
# e os mantém rodando.
# Autor: Albfneto, Brasil, 2016. <albfneto@fcfrp.usp.br>
# Feito baseado em outros Scripts de:
# Arthur_Hoch, MsOliver e Listeiro_O37.
# https://edpsblog.wordpress.com/2016/07/29/zswap-em-sabayon-linux-
# controlavel-ligavel-e-desligavel/

 
# Checa Sudo:
 # Esta porção do código, modificada do publicado por: Braiam, 2015.
# Site: askubuntu.com/questions/711580/how-to-enter-password-only-once-in-a-bash-script-needing-sudo
if [[ $EUID -ne 0 ]]; then
   echo "Este Script precisa ser executado como Root, porisso use: sudo sh "$0""
   1>&2
   exit 1
fi

# Função Print:
 print(){
       echo -e "\n\n$1\n\n"
       if [ ! -z $2 ]; then sleep $2; fi
  }
# Mensagens Iniciais
print "ACELERADOR..."
print "Script Acelerador de Computador." 
print "Carrega Preload e Verynice"

# Carregando Preload:
# Preload é "Daemonizado", mas mesmo assim, comando para
# manter sua execução:
preload &
sleep 4
print "Preload Carregado..." 
sleep 2
ps ax | grep preload
echo

# Carregando Verynice:
sleep 4
# Ativando o Verynice, comando planejado para manter sua execução
# após fechado o terminal:
verynice &
sleep 2
print "Verynice Carregado..." 
echo
ps ax | grep verynice
echo

 print "Ambos os Aceleradores Carregados"
 print "Pode fechar seu Terminal, os aceleradores continuarão rodando"
  print "Tô saindo, Tchau"
 sleep 4 
 exit 0
