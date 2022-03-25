#!/bin/bash

. /etc/init.d/functions.sh

ebegin "Montando /mnt/gentoo/proc"
if [ -z "$(mount | grep /mnt/gentoo/proc)" ]
then
     mount -t proc proc /mnt/gentoo/proc
else
     eerror "/mnt/gentoo/proc já está montado"
fi
eend $?

ebegin "Montando /mnt/gentoo/sys"
if [ -z "$(mount | grep /mnt/gentoo/sys)" ]
then
     mount --bind /sys /mnt/gentoo/sys
     mount --make-rslave /mnt/gentoo/sys
else
     eerror "/mnt/gentoo/sys já está montado"
fi
eend $?

ebegin "Montando /mnt/gentoo/dev"
if [ -z "$(mount | grep /mnt/gentoo/dev)" ]
then
     mount --bind /dev /mnt/gentoo/dev
     mount --make-rslave /mnt/gentoo/dev
else
     eerror "/mnt/gentoo/dev já está montado"
fi
eend $?

ebegin "Inicinando chroot /mnt/gentoo/"
      chroot /mnt/gentoo/ /bin/bash
eend $?

ebegin "Desmontando /mnt/gentoo/proc"
if [ -z "$(mount | grep /mnt/gentoo/proc)" ]
then
     eerror "/mnt/gentoo/proc já está montado"
else
     umount /mnt/gentoo/proc
fi
eend $?

ebegin "Desmontando /mnt/gentoo/sys"
if [ -z "$(mount | grep /mnt/gentoo/sys)" ]
then
     eerror "/mnt/gentoo/sys já está desmontado"
else
     umount /mnt/gentoo/sys
fi
eend $?

ebegin "Desmontando /mnt/gentoo/dev"
if [ -z "$(mount | grep /mnt/gentoo/dev)" ]
then
     eerror "/mnt/gentoo/dev já está desmontado"
else
          umount /mnt/gentoo/dev
fi
eend $?

#mounttmpfs() {
#     mount -t tmpfs tmpfs -o size=$MEMSIZE $DIR
#     mounted="true"
#} 
