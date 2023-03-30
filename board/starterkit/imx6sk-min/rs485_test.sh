#!/bin/sh

stty -F /dev/ttymxc2 rs485

echo 1 > /dev/ttymxc2

