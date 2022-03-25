#!/bin/sh

if [ ! $# -eq 2 ] || [ "$1" = "--help" ] ; then
    echo "Usage: $(basename $0) <start|stop> zram[0-n]"
    exit 1
fi

device="/dev/$2"
config="/sys/block/$2"
image="/var/lib/zdisk/$2"
mount="/mnt/zdisk/$2"

if [ ! -b $device ]; then
    echo "Error: $device isn't valid!"
    exit 1
fi

if [ ! -f $image ]; then
    echo "Error: $image isn't valid!"
    exit 1
fi

if [ ! -d $mount ]; then
    echo "Error: $mount isn't valid!"
    exit 1
fi

case $1 in
    "start")
        if [ ! $(cat $config/initstate) -eq 0 ]; then
            echo "Error: $device is in use, please use another one!"
            exit 1
        fi
        
        if [ ! -r $image ]; then
            echo "Error: $image isn't readable!"
            exit 1
        fi
        
        echo "Starting zRAM Disk $1"

        if [ ! -f $config/comp_algorithm ]; then
          echo "Warning: cannot use LZ4 compression, defaulting to LZO (slower!)"
        else
          echo -n lz4 > $config/comp_algorithm
        fi
        
        wc -c $image > $config/disksize
        dd bs=4M if=$image of=$device
        mount $device $mount
        ;;

    "stop")
        if [ ! $(cat $config/initstate) -eq 1 ]; then
            echo "Error: $device isn't valid!"
            exit 1
        fi

        if [ ! -w $image ]; then
            echo "Error: $image isn't writable!"
        fi
        
        echo "Stopping zRAM Disk $1"

        umount $mount
        dd bs=4M if=$device of=$image
        echo -n 1 > $config/reset
        ;;

    *)
        echo "Need help? Start with --help"
        ;;
esac
