#!/bin/bash

SPICE_PORT=5926
NAME='Windows 10'

function qemu(){
  if [ -x "$(command -v qemu-system-x86_64)" ]; then
    exec qemu-system-x86_64 \
      -enable-kvm -rtc base=localtime \
      -m 8096 -cpu host,kvm=off -smp 3 -machine type=pc,accel=kvm \
      -monitor stdio -name '$NAME' \
      -bios /home/peregrinus/scripts/OVMF.fd \
      -drive id=disk0,file=/dev/disk/by-id/ata-HITACHI_HTS723216L9SA60091216FC12F0NCJ8RL8G,cache=none,aio=native,format=raw,if=none \
      -device virtio-blk-pci,drive=disk0,bootindex=0 \
      -soundhw hda -vga none -device qxl-vga,vgamem_mb=32 -usbdevice tablet \
      -spice port=${SPICE_PORT},disable-ticketing \
      -device virtio-serial \
      -chardev spicevmc,id=vdagent,name=vdagent \
      -device virtserialport,chardev=vdagent,name=com.redhat.spice.0 \
      -net tap,ifname=$tapIn,script=no,downscript=no -net nic,model=virtio,macaddr=00:00:00:00:00:0$tapNum \
      -device ich9-usb-ehci1,id=usb \
      -device ich9-usb-uhci1,masterbus=usb.0,firstport=0,multifunction=on \
      -device ich9-usb-uhci2,masterbus=usb.0,firstport=2 \
      -device ich9-usb-uhci3,masterbus=usb.0,firstport=4 \
      -chardev spicevmc,name=usbredir,id=usbredirchardev1 \
      -device usb-redir,chardev=usbredirchardev1,id=usbredirdev1 \
      -chardev spicevmc,name=usbredir,id=usbredirchardev2 \
      -device usb-redir,chardev=usbredirchardev2,id=usbredirdev2 \
      -chardev spicevmc,name=usbredir,id=usbredirchardev3 \
      -device usb-redir,chardev=usbredirchardev3,id=usbredirdev3 &

    pidQEMU=$!

  else 
    printf "O comando qmeu-system-x86_64 não está instalado\n"
  fi
}

function dipSpi(){
  sleep 1
  if [ -x "$(command -v spicy)" ]; then
    printf "Inicializando display\n"
    spicy -h localhost -p $SPICE_PORT &
  else
    printf "spicy não está instalado\n"
  fi
}

function anyWait(){
  printf "Aguardando fim do processo $1\n"

  while [[ ( -d /proc/$1 ) && ( -z `grep zombie /proc/$1/status` ) ]]; do
    sleep 1
  done
}

function main(){
  if [ -x "$(command -v tunctl)" ]; then
    if [ -x "$(command -v gksudo)" ]; then
      tapIn=$(gksudo -u root "tunctl -u peregrinus" | awk '{print $2}' | sed 's/'\''//g')
      tapNum=$(echo $tapIn | sed 's/tap//g')
    else
      printf "O comando gksudo não está instalado\n"
    fi
  else
    printf "O comando tunctl não está instalado\n"
  fi

#  pidQEMU=$(qemu&)
  qemu
  printf "O processo QEMU foi iniciado com o PID $pidQEMU\n"
  dipSpi

  if [ -z ${pidQEMU+x} ]; then
    printf "QEMU não iniciado\n"
  else
    anyWait $pidQEMU
  fi

  if [ -x "$(command -v gksudo)" ]; then
    gksudo -u root "tunctl -d $tapIn"
  fi
}

main
