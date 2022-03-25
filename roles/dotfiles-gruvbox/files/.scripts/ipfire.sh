#!/bin/bash

qemu-system-x86_64 -enable-kvm \
		   -rtc base=localtime \
		   -m 512 -cpu host \
		   -monitor stdio -name 'Ipfire' \
		   -drive file=ipfire.qcow2,media=disk \
#		   -drive file=ipfire-2.17.i586-full-core95.iso,media=cdrom -boot d \
		   -soundhw hda -vga qxl -usbdevice tablet \
		   -net nic,model=virtio -net tap,ifname=tap0,script=no,downscript=no -net nic -net user \
		   -net nic,model=virtio -net tap,ifname=tap1,script=no,downscript=no -net nic -net user
