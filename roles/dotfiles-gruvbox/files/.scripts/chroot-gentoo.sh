#!/bin/bash

. /etc/init.d/functions.sh

ebegin "Montando /home/peregrinus/gentoo/proc"
if [ -z "$(mount | grep /home/peregrinus/gentoo/proc)" ]
then
     mount -t proc proc /home/peregrinus/gentoo/proc
else
     eerror "/home/peregrinus/gentoo/proc já está montado"
fi
eend $?

ebegin "Montando /home/peregrinus/gentoo/sys"
if [ -z "$(mount | grep /home/peregrinus/gentoo/sys)" ]
then
     mount --bind /sys /home/peregrinus/gentoo/sys
     mount --make-rslave /home/peregrinus/gentoo/sys
else
     eerror "/home/peregrinus/gentoo/sys já está montado"
fi
eend $?

ebegin "Montando /home/peregrinus/gentoo/dev"
if [ -z "$(mount | grep /home/peregrinus/gentoo/dev)" ]
then
     mount --bind /dev /home/peregrinus/gentoo/dev
     mount --make-rslave /home/peregrinus/gentoo/dev
else
     eerror "/home/peregrinus/gentoo/dev já está montado"
fi
eend $?

ebegin "Inicinando chroot /home/peregrinus/gentoo"
      chroot /home/peregrinus/gentoo /bin/bash
eend $?

ebegin "Desmontando /home/peregrinus/gentoo/proc"
if [ -z "$(mount | grep /home/peregrinus/gentoo/proc)" ]
then
     eerror "/home/peregrinus/gentoo/proc já está montado"
else
     umount /home/peregrinus/gentoo/proc
fi
eend $?

ebegin "Desmontando /home/peregrinus/gentoo/sys"
if [ -z "$(mount | grep /home/peregrinus/gentoo/sys)" ]
then
     eerror "/home/peregrinus/gentoo/sys já está desmontado"
else
     umount /home/peregrinus/gentoo/sys
fi
eend $?

ebegin "Desmontando /home/peregrinus/gentoo/dev"
if [ -z "$(mount | grep /home/peregrinus/gentoo/dev)" ]
then
     eerror "/home/peregrinus/gentoo/dev já está desmontado"
else
          umount /home/peregrinus/gentoo/dev
fi
eend $?

#mounttmpfs() {
#     mount -t tmpfs tmpfs -o size=$MEMSIZE $DIR
#     mounted="true"
#} 
