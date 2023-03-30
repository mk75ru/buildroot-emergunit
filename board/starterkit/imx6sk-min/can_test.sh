#!/bin/sh

killall candump

candump can0 &
cansend can0 5A2#01.02.03.04.05

