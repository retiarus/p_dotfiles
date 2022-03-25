#!/bin/bash

SPICE_PORT=5925

qemu-system-x86_64 -enable-kvm \
		   -rtc base=localtime \
		   -m 4096 -cpu host \
		   -monitor stdio -name 'falco-debian' \
		   -drive file=falco-debian.qcow2,cache=none,if=virtio,aio=native,format=qcow2 \
		   -soundhw hda -vga qxl -usbdevice tablet \
                   -spice port=${SPICE_PORT},disable-ticketing \
                   -device virtio-serial \
                   -chardev spicevmc,id=vdagent,name=vdagent \
                   -device virtserialport,chardev=vdagent,name=com.redhat.spice.0 \
		   -net tap,ifname=tap2,script=no,downscript=no -net nic,model=virtio,macaddr=00:00:00:00:00:02 \
                   -device ich9-usb-ehci1,id=usb \
                   -device ich9-usb-uhci1,masterbus=usb.0,firstport=0,multifunction=on \
                   -device ich9-usb-uhci2,masterbus=usb.0,firstport=2 \
                   -device ich9-usb-uhci3,masterbus=usb.0,firstport=4 \
                   -chardev spicevmc,name=usbredir,id=usbredirchardev1 \
                   -device usb-redir,chardev=usbredirchardev1,id=usbredirdev1 \
                   -chardev spicevmc,name=usbredir,id=usbredirchardev2 \
                   -device usb-redir,chardev=usbredirchardev2,id=usbredirdev2 \
                   -chardev spicevmc,name=usbredir,id=usbredirchardev3 \
                   -device usb-redir,chardev=usbredirchardev3,id=usbredirdev3


