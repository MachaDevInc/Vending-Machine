#!/bin/sh -e

mkswap /dev/mmcblk0p1
swapon /dev/mmcblk0p1

output=$(cat /root/install_step)
if [ "$output" != 2 ]; then
    sh install.sh
else
    python3 /root/WiFiSetup.py
    python3 /root/VM.py &
fi
