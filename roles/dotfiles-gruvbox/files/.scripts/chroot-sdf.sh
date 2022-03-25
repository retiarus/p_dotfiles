#!/bin/bash

. /etc/init.d/functions.sh

ebegin "Montando /mnt/sdf/proc"
if [ -z "$(mount | grep /mnt/sdf/proc)" ]
then
     mount -t proc proc /mnt/sdf/proc
else
     eerror "/mnt/sdf/proc já está montado"
fi
eend $?

ebegin "Montando /mnt/sdf/sys"
if [ -z "$(mount | grep /mnt/sdf/sys)" ]
then
     mount --bind /sys /mnt/sdf/sys
     mount --make-rslave /mnt/sdf/sys
else
     eerror "/mnt/sdf/sys já está montado"
fi
eend $?

ebegin "Montando /mnt/sdf/dev"
if [ -z "$(mount | grep /mnt/sdf/dev)" ]
then
     mount --bind /dev /mnt/sdf/dev
     mount --make-rslave /mnt/sdf/dev
else
     eerror "/mnt/sdf/dev já está montado"
fi
eend $?

ebegin "Inicinando chroot /mnt/sdf"
      chroot /mnt/sdf /bin/bash
eend $?

ebegin "Desmontando /mnt/sdf/proc"
if [ -z "$(mount | grep /mnt/sdf/proc)" ]
then
     eerror "/mnt/sdf/proc já está montado"
else
     umount /mnt/sdf/proc
fi
eend $?

ebegin "Desmontando /mnt/sdf/sys"
if [ -z "$(mount | grep /mnt/sdf/sys)" ]
then
     eerror "/mnt/sdf/sys já está desmontado"
else
     umount /mnt/sdf/sys
fi
eend $?

ebegin "Desmontando /mnt/sdf/dev"
if [ -z "$(mount | grep /mnt/sdf/dev)" ]
then
     eerror "/mnt/sdf/dev já está desmontado"
else
          umount /mnt/sdf/dev
fi
eend $?

#mounttmpfs() {
#     mount -t tmpfs tmpfs -o size=$MEMSIZE $DIR
#     mounted="true"
#} 
