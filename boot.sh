#!/bin/sh -e

mkswap /dev/mmcblk0p1
swapon /dev/mmcblk0p1

output=$(cat /root/install_step)
if [ "$output" != 2 ]; then
    sh /root/install.sh >> /root/output.txt 2>&1
else
    python3 /root/WiFiSetup.py >> /root/output.txt 2>&1
    python3 /root/VM.py >> /root/output.txt 2>&1
fi
