#!/usr/bin/env sh

echo "Source  patch - dounloads/linux_imx_4.9.x_1.0.0_ga-sk.tar.bz2 "

PATH_TO_FILE="arch/arm/boot/dts/imx6ull-sk-nano-2eth.dts"

diff -u a/$PATH_TO_FILE b/$PATH_TO_FILE > 0004-imx6ull-sk-nano-2eth.patch
