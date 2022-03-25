#!/bin/bash
# from http://gentoo-wiki.com/TIP_Speeding_up_portage_with_tmpfs
# further adapted by teknohog
# tmpfs can use swap too

DIR=/var/tmp/portage
mounted=false
 
. /etc/init.d/functions.sh
 
mounttmpfs() {
     mount -t tmpfs tmpfs -o uid=250,gid=250,mode=0775,size=8G $DIR
     mounted="true"
}

compile() {
     einfo "emerging ${*}"
          emerge ${*}
}

unmount() {
     ebegin "unmounting tmpfs"
	# Ensure umount success by killing hung processes.. this is
	# sometimes dangerous, better put into a separate script
	#HUNG="`fuser -m $DIR | grep '[0-9]\+'`"
	#if [ -n "$HUNG" ]; then
	#	kill -9 $HUNG
	#fi	

          umount -f $DIR
     eend $?
}

ebegin "Mounting $MEMSIZE of memory to $DIR"
if [ -z "$(mount | grep $DIR)" ]
then
     mounttmpfs
else
     eerror "tmpfs already mounted"
     exit 0
fi
eend $?

compile ${*}
 
if [ -n "$mounted" ]
then
     unmount
fi
