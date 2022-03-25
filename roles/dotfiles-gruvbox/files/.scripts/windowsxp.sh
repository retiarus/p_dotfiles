#!/bin/bash

qemu-system-x86_64  -enable-kvm \
		    -rtc base=localtime \
		    -m 2048 -cpu host \
		    -monitor stdio \
		    -name 'Windows XP' \
		    -drive file=/home/peregrinus/windowsxp.qcow2,media=disk \
		    -soundhw hda -vga qxl -usbdevice tablet \
		    -netdev tap,id=network0,ifname=tap0,script=no,downscript=no

