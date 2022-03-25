!#/bin/bash

mount -t proc proc /run/media/peregrinus/58fedda2-5356-4322-91ad-ed7c24fc0d87/peregrinus/funtoo/proc
mount --rbind /sys /run/media/peregrinus/58fedda2-5356-4322-91ad-ed7c24fc0d87/peregrinus/funtoo/sys
mount --make-rslave /run/media/peregrinus/58fedda2-5356-4322-91ad-ed7c24fc0d87/peregrinus/funtoo/sys
mount --rbind /dev /run/media/peregrinus/58fedda2-5356-4322-91ad-ed7c24fc0d87/peregrinus/funtoo/dev
mount --make-rslave /run/media/peregrinus/58fedda2-5356-4322-91ad-ed7c24fc0d87/peregrinus/funtoo/dev
