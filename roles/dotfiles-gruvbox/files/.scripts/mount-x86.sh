#!/bin/bash

. /etc/init.d/functions.sh

ebegin "Montando /falco-x86/proc"
if [ -z "$(mount | grep /falco-x86/proc)" ]
then
     mount -t proc proc /falco-x86/proc
     statusmountproc = $?
else     
     eerror "/falco-x86/proc já está montado"
fi
eend $?

ebegin "Montando /falco-x86/sys"
if [ -z "$(mount | grep /falco-x86/sys)" ]
then
     mount --bind /sys /falco-x86/sys
     mount --make-rslave /falco-x86/sys
     statusmountsys = $?
else
     eerror "/falco-x86/sys já está montado"
fi
eend $?

ebegin "Montando /falco-x86/dev"
if [ -z "$(mount | grep /falco-x86/dev)" ]
then
     mount --bind /dev /falco-x86/dev
     mount --make-rslave /falco-x86/dev
     statusmountdev = $?
else
     eerror "/falco-x86/dev já está montado"
fi
eend $?

#mounttmpfs() {
#     mount -t tmpfs tmpfs -o size=$MEMSIZE $DIR
#     mounted="true"
#} 
