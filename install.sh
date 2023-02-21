output=$(cat /root/disk_partition_flag)
if [ [ "$output" == 0 ] || [ "$output" == "" ] ]; then
    echo "Partitioning the memory and setting up swap memory"
    opkg update
    opkg install fdisk kmod-fs-ext4 e2fsprogs swap-utils block-mount
    umount /dev/mmcblk0
    fdisk /dev/mmcblk0 << EOF
    I
    Disk_Partition_Table
    w
EOF

    mkfs.ext4 /dev/mmcblk0p2 << EOF
    y
EOF

    mkswap /dev/mmcblk0p1
    swapon /dev/mmcblk0p1

    /etc/init.d/fstab enable
    block detect > /etc/config/fstab

    flag_update=/root/disk_partition_flag
    cat /root/flag_one>$flag_update

    reboot && exit
fi

if [ "$output" == 1 ]; then
    echo "Downloading the packages and libraries"
    opkg update
    opkg install python3-pip git-http

    pip3 install --upgrade pip
    pip3 install stripe

    cd

    git clone 

    flag_update=/root/disk_partition_flag
    cat /root/flag_two>$flag_update
fi

if [ "$output" == 2 ]; then
    echo "System is running"
    python3 WiFiSetup.py
    python3 VM.py &
fi