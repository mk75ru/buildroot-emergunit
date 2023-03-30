eval $(grep "BR2_TARGET_UBOOT_BOARDNAME" .config)
eval $(grep "BR2_TARGET_UART3_DTB" .config)

BOARD_DIR=board/starterkit/imx6sk-min

if grep -q "BR2_TARGET_UBOOT_WATCHDOG=y" .config; then
    install -m 0755 $BOARD_DIR/S15watchdog $1/etc/init.d/
else
    test -f $1/etc/init.d/S15watchdog && rm $1/etc/init.d/S15watchdog
fi

if grep -q "BR2_PACKAGE_QT5BASE_EXAMPLES=y" .config; then
    test -d output/staging/usr/lib/qt/examples && cp -r output/staging/usr/lib/qt/examples $1/usr/lib/qt/
fi

test -d $1/etc/usbmount && install -m 0644 $BOARD_DIR/usbmount.conf $1/etc/usbmount/
test -f $1/lib/udev/rules.d/80-net-name-slot.rules && rm $1/lib/udev/rules.d/80-net-name-slot.rules
rm $1/usr/lib/imx-mm/parser/lib_mkv_parser*

cp output/images/u-boot.imx $1/boot/
install -m 0755 $BOARD_DIR/S02acpid $1/etc/init.d/
install -D -m 0755 $BOARD_DIR/00000080 $1/etc/acpi/PWRF/00000080
install -m 0755 $BOARD_DIR/S45rus $1/etc/init.d/
install -m 0755 $BOARD_DIR/S10udev $1/etc/init.d/
install -m 0644 $BOARD_DIR/profile.sh $1/etc/profile.d/
install -m 0644 $BOARD_DIR/interfaces $1/etc/network/
install -m 0644 $BOARD_DIR/fw_env.config $1/etc/
install -m 0644 $BOARD_DIR/inittab $1/etc/
install -m 0644 $BOARD_DIR/asound.conf $1/etc/
install -m 0644 $BOARD_DIR/vsftpd.conf $1/etc/
test -f $1/etc/ssh/sshd_config && sed -i 's/^.*UseDNS.*$/UseDNS no/g' $1/etc/ssh/sshd_config
test -f $1/etc/ssh/sshd_config && sed -i 's/^.*PermitRootLogin.*$/PermitRootLogin yes/g' $1/etc/ssh/sshd_config
rm $1/etc/resolv.conf
echo "nameserver 8.8.8.8" > $1/etc/resolv.conf
echo "nameserver 4.2.2.4" >> $1/etc/resolv.conf
echo "SK-iMX6ULL" > $1/etc/hostname

install -m 0755 $BOARD_DIR/S90affine $1/etc/init.d/
install -m 0755 $BOARD_DIR/affine.sh $1/root/

install -m 0755 $BOARD_DIR/S91aplay $1/etc/init.d/
install -m 0644 $BOARD_DIR/a2002011001-e02-8kHz.wav $1/root/

install -m 0755 $BOARD_DIR/can_test.sh $1/root/
install -m 0755 $BOARD_DIR/rs485_test.sh $1/root/
