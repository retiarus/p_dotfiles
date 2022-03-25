#!/bin/bash
exec qemu-system-x86_64 -enable-kvm \
        -cpu host \
        -drive file=$HOME/centos.qcow2,if=virtio \
        -net nic -net user,hostname=CentOS-VM \
        -m 4096M \
        -monitor stdio \
        -name "CentOS-VM" \
        $@
