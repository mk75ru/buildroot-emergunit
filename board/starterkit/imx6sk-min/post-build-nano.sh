eval $(grep "BR2_TARGET_UBOOT_BOARD_DEFCONFIG" .config)

BOARD_DIR=board/starterkit/imx6sk-min

if grep -q "BR2_TARGET_UBOOT_WATCHDOG=y" .config; then
    install -m 0755 $BOARD_DIR/S15watchdog $1/etc/init.d/
else
    test -f $1/etc/init.d/S15watchdog && rm $1/etc/init.d/S15watchdog
fi

#install -m 0755 $BOARD_DIR/S02acpid $1/etc/init.d/
#install -D -m 0755 $BOARD_DIR/00000080 $1/etc/acpi/PWRF/00000080
install -m 0755 $BOARD_DIR/S45rus $1/etc/init.d/
install -m 0644 $BOARD_DIR/interfaces $1/etc/network/
install -m 0644 $BOARD_DIR/vsftpd.conf $1/etc/
install -m 0644 $BOARD_DIR/inittab $1/etc/
#install -m 0644 $BOARD_DIR/asound.conf $1/etc/
install -m 0644 $BOARD_DIR/vsftpd.conf $1/etc/
test -f $1/etc/ssh/sshd_config && sed -i 's/^.*UseDNS.*$/UseDNS no/g' $1/etc/ssh/sshd_config
test -f $1/etc/ssh/sshd_config && sed -i 's/^.*PermitRootLogin.*$/PermitRootLogin yes/g' $1/etc/ssh/sshd_config
rm $1/etc/resolv.conf
echo "nameserver 8.8.8.8" > $1/etc/resolv.conf
echo "nameserver 4.2.2.4" >> $1/etc/resolv.conf
echo "SK-iMX6ULL" > $1/etc/hostname

if echo "$BR2_TARGET_UBOOT_BOARD_DEFCONFIG" | grep -q "plc"; then
    sed -i '/ttyGS0/d' $1/etc/inittab
fi

install -m 0755 $BOARD_DIR/S91aplay $1/etc/init.d/
install -m 0644 $BOARD_DIR/a2002011001-e02-8kHz.wav $1/root/

install -m 0755 $BOARD_DIR/can_test.sh $1/root/
install -m 0755 $BOARD_DIR/rs485_test.sh $1/root/

install -m 0644 $BOARD_DIR/mdev.conf $1/etc/
install -m 0755 $BOARD_DIR/auto_mount $1/bin/

