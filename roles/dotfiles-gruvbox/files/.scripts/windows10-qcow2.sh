#!/bin/bash

SPICE_PORT=5928

qemu-system-x86_64 -enable-kvm \
		   -rtc base=localtime \
		   -m 8096 -cpu host,kvm=off -smp 3 -machine type=pc,accel=kvm \
		   -monitor stdio -name 'Wndows10' \
		   -boot d \
		   -drive file=$HOME/qcow2-raw/windows10.qcow2,cache=none,aio=native,format=qcow2 \
		   -soundhw hda -vga none -device qxl-vga,vgamem_mb=32 -usbdevice tablet \
		   -spice port=${SPICE_PORT},disable-ticketing \
		   -device virtio-serial \
		   -chardev spicevmc,id=vdagent,name=vdagent \
		   -device virtserialport,chardev=vdagent,name=com.redhat.spice.0 \
   		   -net tap,ifname=tap1,script=no,downscript=no -net nic,model=virtio,macaddr=00:00:00:00:00:01 \
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


