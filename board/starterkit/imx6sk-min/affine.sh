#!/bin/sh

[ -x /usr/lib/qt/examples/widgets/painting/affine/affine ] || exit 0

export LANG=ru_RU.UTF-8
export TSLIB_TSDEVICE=/dev/input/event1
export FB_MULTI_BUFFER=2
export QT_QPA_GENERIC_PLUGINS=tslib:/dev/input/event1
export QT_QPA_PLATFORM=linuxfb
export QT_QPA_FB_TSLIB=1

test -f /etc/pointercal || ts_calibrate
exec /usr/lib/qt/examples/widgets/painting/affine/affine
