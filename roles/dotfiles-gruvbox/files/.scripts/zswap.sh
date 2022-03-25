#!/bin/sh

if [ ! $# -eq 2 ] || [ "$1" = "--help" ] ; then
    echo "Usage: $(basename $0) <start|stop> zram[0-n]"
    exit 1
fi

device="/dev/$2"
config="/sys/block/$2"

if [ ! -b $device ]; then
    echo "Error: $device isn't valid!"
    exit 1
fi

case $1 in
    "start")
        if [ ! $(cat $config/initstate) -eq 0 ]; then
            echo "Error: $device is in use, please use another one!"
            exit 1
        fi
        
        echo "Starting zRAM Swap $1"

        if [ ! -f $config/comp_algorithm ]; then
          echo "Warning: cannot use LZ4 compression, defaulting to LZO (slower!)"
        else
          echo -n lz4 > $config/comp_algorithm
        fi

        awk '($1 == "MemTotal:"){print $2*1024/2}' /proc/meminfo > $config/disksize        
        mkswap $device
        swapon -p 32767 $device
        ;;

    "stop")
        if [ ! $(cat $config/initstate) -eq 1 ]; then
            echo "Error: $device isn't valid!"
            exit 1
        fi

        echo "Stopping zRAM Swap $1"

        swapoff $device
        echo -n 1 > $config/reset
        ;;

    *)
        echo "Need help? Start with --help"
        ;;
esac
