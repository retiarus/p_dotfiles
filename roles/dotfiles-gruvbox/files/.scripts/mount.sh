!#/bin/bash

mount -t proc proc /mnt/falco04/proc
mount --bind /sys /mnt/falco04/sys
mount --make-rslave /mnt/falco04/sys
mount --bind /dev /mnt/falco04/dev
mount --make-rslave /mnt/falco04/dev
