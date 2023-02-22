#!/bin/sh -e

mkswap /dev/mmcblk0p1
swapon /dev/mmcblk0p1

python3 /root/WiFiSetup.py
python3 /root/VM.py
