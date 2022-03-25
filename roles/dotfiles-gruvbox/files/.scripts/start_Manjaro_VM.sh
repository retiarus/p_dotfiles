#!/bin/bash
exec qemu-system-x86_64 -enable-kvm \
        -cpu host \
        -drive file=$HOME/manjaro.qcow2,if=virtio \
        -net nic -net user,hostname=Manjaro-VM \
        -m 4096M \
        -monitor stdio \
        -name "Manjaro-VM" \
        $@
