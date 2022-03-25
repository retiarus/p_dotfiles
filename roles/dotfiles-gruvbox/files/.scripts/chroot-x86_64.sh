#!/bin/bash

default="ubuntu"

if [ -z "$(mount | grep /mnt/${default}/proc)" ]
then
     mount -t proc proc /mnt/${default}/proc
else
     eerror "/mnt/${default}/proc já está montado"
fi

if [ -z "$(mount | grep /mnt/${default}/sys)" ]
then
     mount --bind /sys /mnt/${default}/sys
     mount --make-rslave /mnt/${default}/sys
else
     eerror "/mnt/${default}/sys já está montado"
fi

if [ -z "$(mount | grep /mnt/${default}/dev)" ]
then
     mount --bind /dev /mnt/${default}/dev
     mount --make-rslave /mnt/${default}/dev
else
     eerror "/mnt/${default}/dev já está montado"
fi

chroot /mnt/${default} /bin/bash

if [ -z "$(mount | grep /mnt/${default}/proc)" ]
then
     eerror "/mnt/${default}/proc já está montado"
else
     umount /mnt/${default}/proc
fi

if [ -z "$(mount | grep /mnt/${default}/sys)" ]
then
     eerror "/mnt/${default}/sys já está desmontado"
else
     umount /mnt/${default}/sys
fi

if [ -z "$(mount | grep /mnt/${default}/dev)" ]
then
     eerror "/mnt/${default}/dev já está desmontado"
else
          umount /mnt/${default}/dev
fi
