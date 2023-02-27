output=$(cat /root/install_step)
if [ "$output" != 1 ] && [ "$output" != 2 ]; then
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

    sed -i "s/option enabled '0'/option enabled '1'/g" /etc/config/fstab
    sed -i "s+option target '/mnt/mmcblk0p2'+option target '/overlay'+g" /etc/config/fstab

    flag_update=/root/install_step
    cat /root/flag_one>$flag_update

    reboot && exit
fi

if [ "$output" == 1 ]; then
    echo "Downloading the packages and libraries"

    sleep 20

    opkg update
    opkg install python3-pip

    pip3 install --upgrade pip
    pip3 install stripe
    pip3 install python-dotenv
    pip3 install pyserial

    flag_update=/root/install_step
    cat /root/flag_two>$flag_update

    reboot && exit
fi
