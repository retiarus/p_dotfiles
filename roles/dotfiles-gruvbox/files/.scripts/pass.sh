#!/bin/bash

echo "1033 0194"  > /sys/bus/pci/drivers/pci-stub/new_id
echo "0000:02:00.0" > /sys/bus/pci/devices/0000:02:00.0/driver/unbind
echo "0000:02:00.0" > /sys/bus/pci/drivers/pci-stub/bind
