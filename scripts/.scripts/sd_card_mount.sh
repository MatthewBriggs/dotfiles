#!/bin/bash

# required on MacbookPro 2012 due to
# https://bugzilla.kernel.org/show_bug.cgi?id=73241

/usr/bin/rmmod -f tg3 

/usr/bin/modprobe sdhci 

/usr/bin/modprobe tg3

/usr/bin/zpool import -f sdcard

swapon /dev/mmcblk0p2

exit 0
