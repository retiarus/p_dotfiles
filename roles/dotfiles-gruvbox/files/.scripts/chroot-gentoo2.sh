#!/bin/bash

vgchange -a y 2>/dev/null 

. /etc/init.d/functions.sh

ebegin "Montando $1/proc"
if [ -z "$(mount | grep $1/proc)" ]
then
     mount -t proc proc $1/proc
else
     eerror "$1/proc já está montado"
fi
eend $?

ebegin "Montando $1/sys"
if [ -z "$(mount | grep $1/sys)" ]
then
     mount --rbind /sys $1/sys
     mount --make-rslave $1/sys
else
     eerror "$1/sys já está montado"
fi
eend $?

ebegin "Montando $1/dev"
if [ -z "$(mount | grep $1/dev)" ]
then
     mount --rbind /dev $1/dev
     mount --make-rslave $1/dev
else
     eerror "$1/dev já está montado"
fi
eend $?

ebegin "Inicinando chroot $1"
      chroot $1 /bin/zsh
eend $?

ebegin "Desmontando $1/proc"
if [ -z "$(mount | grep $1/proc)" ]
then
     eerror "$1/proc já está montado"
else
     umount $1/proc
fi
eend $?

ebegin "Desmontando $1/sys"
if [ -z "$(mount | grep $1/sys)" ]
then
     eerror "$1/sys já está desmontado"
else
     umount $1/sys
fi
eend $?

ebegin "Desmontando $1/dev"
if [ -z "$(mount | grep $1/dev)" ]
then
     eerror "$1/dev já está desmontado"
else
          umount $1/dev
fi
eend $?

