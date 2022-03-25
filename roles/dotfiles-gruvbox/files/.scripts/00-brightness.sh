#!/bin/bash

case $1 in
true)
echo "Enable screen power saving"
echo 5 > /sys/class/backlight/acpi_video0/device/backlight/acpi_video0/brightness
;;
false)
echo "Disable screen power saving"
echo 14 > /sys/class/backlight/acpi_video0/device/backlight/acpi_video0/brightness
;;
esac

