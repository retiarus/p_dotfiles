#!/bin/bash

. /etc/init.d/functions.sh

vgchange -a y 2>/dev/null

ebegin "Montando /mnt/falco03/root"
if [ -z "$(mount | grep /mnt/falco03/root)" ]
then
     mount /dev/vg_falco03/root /mnt/falco03/root
else
     eerror "/mnt/falco03/root já está montado"
fi
eend $?

ebegin "Montando /mnt/falco03/root/home"
if [ -z "$(mount | grep /mnt/falco03/root/home)" ]
then
     mount /dev/vg_falco03/home /mnt/falco03/root/home
else
     eerror "/mnt/falco03/root/home já está montado"
fi
eend $?

ebegin "Montando /mnt/falco03/root/boot"
if [ -z "$(mount | grep /mnt/falco03/root/boot)" ]
then
     mount UUID="8c7e6649-4d6c-4a9a-a81b-a157ba294ad2" /mnt/falco03/root/boot
else
     eerror "/mnt/falco03/root/boot já está montado"
fi
eend $?

ebegin "Montando /mnt/falco03/root/proc"
if [ -z "$(mount | grep /mnt/falco03/root/proc)" ]
then
     mount -t proc proc /mnt/falco03/root/proc
else
     eerror "/mnt/falco03/root/proc já está montado"
fi
eend $?

ebegin "Montando /mnt/falco03/root/sys"
if [ -z "$(mount | grep /mnt/falco03/root/sys)" ]
then
     mount --bind /sys /mnt/falco03/root/sys
     mount --make-rslave /mnt/falco03/root/sys
else
     eerror "/mnt/falco03/root/sys já está montado"
fi
eend $?

ebegin "Montando /mnt/falco03/root/dev"
if [ -z "$(mount | grep /mnt/falco03/root/dev)" ]
then
     mount --bind /dev /mnt/falco03/root/dev
     mount --make-rslave /mnt/falco03/root/dev
else
     eerror "/mnt/falco03/root/dev já está montado"
fi
eend $?

ebegin "Inicinando chroot /mnt/falco03/root"
      chroot /mnt/falco03/root /bin/bash
eend $?

ebegin "Desmontando /mnt/falco03/root/proc"
if [ -z "$(mount | grep /mnt/falco03/root/proc)" ]
then
     eerror "/mnt/falco03/root/proc já está montado"
else
     umount /mnt/falco03/root/proc
fi
eend $?

ebegin "Desmontando /mnt/falco03/root/sys"
if [ -z "$(mount | grep /mnt/falco03/root/sys)" ]
then
     eerror "/mnt/falco03/root/sys já está desmontado"
else
     umount /mnt/falco03/root/sys
fi
eend $?

ebegin "Desmontando /mnt/falco03/root/dev"
if [ -z "$(mount | grep /mnt/falco03/root/dev)" ]
then
     eerror "/mnt/falco03/root/dev já está desmontado"
else
          umount /mnt/falco03/root/dev
fi
eend $?

#mounttmpfs() {
#     mount -t tmpfs tmpfs -o size=$MEMSIZE $DIR
#     mounted="true"
#} 
