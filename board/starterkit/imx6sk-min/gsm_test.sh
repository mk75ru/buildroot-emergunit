#!/bin/sh
#GSM power enable - GPIO2.16
echo 48 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio48/direction
echo 1 >  /sys/class/gpio/gpio48/value 

#echo 'ata' > /dev/ttymxc3

microcom /dev/ttymxc3

