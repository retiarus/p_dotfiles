#!/bin/bash

echo "1106 3483" > /sys/bus/pci/drivers/pci-stub/new_id
echo "0000:01:00.0" > /sys/bus/pci/devices/0000:01:00.0/driver/unbind
echo "0000:01:00.0" > /sys/bus/pci/drivers/pci-stub/bind 
