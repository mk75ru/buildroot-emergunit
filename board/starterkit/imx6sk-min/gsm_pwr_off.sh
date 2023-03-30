#!/bin/sh
#GSM power enable - GPIO2.16
echo 48 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio48/direction
echo 0 >  /sys/class/gpio/gpio48/value 

