#!/bin/bash

# required on MacbookPro 2012 due to
# https://bugzilla.kernel.org/show_bug.cgi?id=73241

/usr/bin/rmmod -f tg3 

/usr/bin/modprobe sdhci 

/usr/bin/modprobe tg3

/usr/bin/zpool import -f sdcard

swapon /dev/mmcblk0p2

exit 0
[Unit]
Description=service file for sd_card_mount.sh

[Service]
ExecStart=/home/matt/.scripts/sd_card_mount.sh
Type=oneshot
User=root

[Install]
WantedBy=multi-user.target

