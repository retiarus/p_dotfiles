#!/bin/bash

. /etc/init.d/functions.sh

ebegin "Montando /home/peregrinus/gentoo-hardened/proc"
if [ -z "$(mount | grep /home/peregrinus/gentoo-hardened/proc)" ]
then
     mount -t proc proc /home/peregrinus/gentoo-hardened/proc
else
     eerror "/home/peregrinus/gentoo-hardened/proc já está montado"
fi
eend $?

ebegin "Montando /home/peregrinus/gentoo-hardened/sys"
if [ -z "$(mount | grep /home/peregrinus/gentoo-hardened/sys)" ]
then
     mount --bind /sys /home/peregrinus/gentoo-hardened/sys
     mount --make-rslave /home/peregrinus/gentoo-hardened/sys
else
     eerror "/home/peregrinus/gentoo-hardened/sys já está montado"
fi
eend $?

ebegin "Montando /home/peregrinus/gentoo-hardened/dev"
if [ -z "$(mount | grep /home/peregrinus/gentoo-hardened/dev)" ]
then
     mount --bind /dev /home/peregrinus/gentoo-hardened/dev
     mount --make-rslave /home/peregrinus/gentoo-hardened/dev
else
     eerror "/home/peregrinus/gentoo-hardened/dev já está montado"
fi
eend $?

ebegin "Inicinando chroot /home/peregrinus/gentoo-hardened"
      chroot /home/peregrinus/gentoo-hardened /bin/bash
eend $?

ebegin "Desmontando /home/peregrinus/gentoo-hardened/proc"
if [ -z "$(mount | grep /home/peregrinus/gentoo-hardened/proc)" ]
then
     eerror "/home/peregrinus/gentoo-hardened/proc já está montado"
else
     umount /home/peregrinus/gentoo-hardened/proc
fi
eend $?

ebegin "Desmontando /home/peregrinus/gentoo-hardened/sys"
if [ -z "$(mount | grep /home/peregrinus/gentoo-hardened/sys)" ]
then
     eerror "/home/peregrinus/gentoo-hardened/sys já está desmontado"
else
     umount /home/peregrinus/gentoo-hardened/sys
fi
eend $?

ebegin "Desmontando /home/peregrinus/gentoo-hardened/dev"
if [ -z "$(mount | grep /home/peregrinus/gentoo-hardened/dev)" ]
then
     eerror "/home/peregrinus/gentoo-hardened/dev já está desmontado"
else
          umount /home/peregrinus/gentoo-hardened/dev
fi
eend $?

#mounttmpfs() {
#     mount -t tmpfs tmpfs -o size=$MEMSIZE $DIR
#     mounted="true"
#} 
