#!/bin/bash

SPICE_PORT=5926

. /etc/init.d/functions.sh

#ebegin "Verificando Sistema de Arquivos"
#if [ -z "$(mount | grep /dev/mapper/vg_falco03-root)" ]
#then 
#else
#  eerror "Sistema de Arquivos root montado"
#  exit
#fi
#eend $?

qemu-system-x86_64 -enable-kvm \
		   -rtc base=localtime \
		   -m 4096 -cpu host -smp 3 -machine type=pc,accel=kvm \
		   -monitor stdio -name 'falco03-gentoo-vm' \
		   -drive file=/dev/sdc,cache=none,aio=native,format=raw,if=virtio \
		   -soundhw hda -usbdevice tablet \
		   -vga none -device qxl-vga,vgamem_mb=64,vram_size_mb=128 \
		   -spice unix,addr=/tmp/vm_spice.socket,disable-ticketing,playback-compression=off \
		   -device virtio-serial \
		   -chardev spicevmc,id=vdagent,name=vdagent \
		   -device virtserialport,chardev=vdagent,name=com.redhat.spice.0 \
   		   -net tap,ifname=tap0,script=no,downscript=no -net nic,model=virtio,macaddr=00:00:00:00:00:00 \
		   -device ich9-usb-ehci1,id=usb \
                   -device ich9-usb-uhci1,masterbus=usb.0,firstport=0,multifunction=on \
                   -device ich9-usb-uhci2,masterbus=usb.0,firstport=2 \
                   -device ich9-usb-uhci3,masterbus=usb.0,firstport=4 \
                   -chardev spicevmc,name=usbredir,id=usbredirchardev1 \
                   -device usb-redir,chardev=usbredirchardev1,id=usbredirdev1 \
                   -chardev spicevmc,name=usbredir,id=usbredirchardev2 \
                   -device usb-redir,chardev=usbredirchardev2,id=usbredirdev2 \
                   -chardev spicevmc,name=usbredir,id=usbredirchardev3 \
                   -device usb-redir,chardev=usbredirchardev3,id=usbredirdev3 \
		   -usb -device usb-host,hostbus=10,hostaddr=3


																													   

