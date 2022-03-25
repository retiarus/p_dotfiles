
qemu-system-x86_64 \
    -enable-kvm \
    -M q35 \
    -m 2G \
    -usb -usbdevice host:16b2:1001 \
    -usb -usbdevice host:0529:0001 \
    -usbdevice tablet \
    -net nic \
    -net bridge,br=br0 \
    -vga qxl \
    -spice port=5930,disable-ticketing \
    -device virtio-serial-pci \
    -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
    -chardev spicevmc,id=spicechannel0,name=vdagent \
    -drive file=/mnt/data/win-patch.img,if=virtio
