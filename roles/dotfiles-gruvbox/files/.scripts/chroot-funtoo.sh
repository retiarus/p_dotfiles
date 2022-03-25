#!/bin/bash

. /etc/init.d/functions.sh

ebegin "Montando /home/peregrinus/funtoo/proc"
if [ -z "$(mount | grep /home/peregrinus/funtoo/proc)" ]
then
     mount -t proc proc /home/peregrinus/funtoo/proc
else
     eerror "/home/peregrinus/funtoo/proc já está montado"
fi
eend $?

ebegin "Montando /home/peregrinus/funtoo/sys"
if [ -z "$(mount | grep /home/peregrinus/funtoo/sys)" ]
then
     mount --bind /sys /home/peregrinus/funtoo/sys
     mount --make-rslave /home/peregrinus/funtoo/sys
else
     eerror "/home/peregrinus/funtoo/sys já está montado"
fi
eend $?

ebegin "Montando /home/peregrinus/funtoo/dev"
if [ -z "$(mount | grep /home/peregrinus/funtoo/dev)" ]
then
     mount --bind /dev /home/peregrinus/funtoo/dev
     mount --make-rslave /home/peregrinus/funtoo/dev
else
     eerror "/home/peregrinus/funtoo/dev já está montado"
fi
eend $?

ebegin "Inicinando chroot /falco-x86_64"
      chroot /home/peregrinus/funtoo /bin/zsh
eend $?

ebegin "Desmontando /home/peregrinus/funtoo/proc"
if [ -z "$(mount | grep /home/peregrinus/funtoo/proc)" ]
then
     eerror "/home/peregrinus/funtoo/proc já está montado"
else
     umount /home/peregrinus/funtoo/proc
fi
eend $?

ebegin "Desmontando /home/peregrinus/funtoo/sys"
if [ -z "$(mount | grep /home/peregrinus/funtoo/sys)" ]
then
     eerror "/home/peregrinus/funtoo/sys já está desmontado"
else
     umount /home/peregrinus/funtoo/sys
fi
eend $?

ebegin "Desmontando /home/peregrinus/funtoo/dev"
if [ -z "$(mount | grep /home/peregrinus/funtoo/dev)" ]
then
     eerror "/home/peregrinus/funtoo/dev já está desmontado"
else
          umount /home/peregrinus/funtoo/dev
fi
eend $?

#mounttmpfs() {
#     mount -t tmpfs tmpfs -o size=$MEMSIZE $DIR
#     mounted="true"
#} 
