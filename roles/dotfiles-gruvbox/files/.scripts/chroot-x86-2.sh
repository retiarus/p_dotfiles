#!/bin/bash

if [ -z "$(mount | grep /mnt/old-gentoo/falco-x86/proc)" ]
then
     mount -t proc proc /mnt/old-gentoo/falco-x86/proc
else
     eerror "/mnt/old-gentoo/falco-x86/proc já está montado"
fi

if [ -z "$(mount | grep /mnt/old-gentoo/falco-x86/sys)" ]
then
     mount --bind /sys /mnt/old-gentoo/falco-x86/sys
     mount --make-rslave /mnt/old-gentoo/falco-x86/sys
else
     eerror "/mnt/old-gentoo/falco-x86/sys já está montado"
fi

if [ -z "$(mount | grep /mnt/old-gentoo/falco-x86/dev)" ]
then
     mount --bind /dev /mnt/old-gentoo/falco-x86/dev
     mount --make-rslave /mnt/old-gentoo/falco-x86/dev
else
     eerror "/mnt/old-gentoo/falco-x86/dev já está montado"
fi
eend $?

ebegin "Inicinando chroot /mnt/old-gentoo/falco-x86"
      chroot /mnt/old-gentoo/falco-x86 /bin/bash
eend $?

ebegin "Desmontando /mnt/old-gentoo/falco-x86/proc"
if [ -z "$(mount | grep /mnt/old-gentoo/falco-x86/proc)" ]
then
     eerror "/mnt/old-gentoo/falco-x86/proc já está montado"
else
     umount /mnt/old-gentoo/falco-x86/proc
fi
eend $?

ebegin "Desmontando /mnt/old-gentoo/falco-x86/sys"
if [ -z "$(mount | grep /mnt/old-gentoo/falco-x86/sys)" ]
then
     eerror "/mnt/old-gentoo/falco-x86/sys já está desmontado"
else
     umount /mnt/old-gentoo/falco-x86/sys
fi
eend $?

ebegin "Desmontando /mnt/old-gentoo/falco-x86/dev"
if [ -z "$(mount | grep /mnt/old-gentoo/falco-x86/dev)" ]
then
     eerror "/mnt/old-gentoo/falco-x86/dev já está desmontado"
else
          umount /mnt/old-gentoo/falco-x86/dev
fi
eend $?

#mounttmpfs() {
#     mount -t tmpfs tmpfs -o size=$MEMSIZE $DIR
#     mounted="true"
#}
