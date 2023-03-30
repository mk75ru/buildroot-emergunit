eval $(grep "BR2_TARGET_UBOOT_BOARD_DEFCONFIG" .config)

BOARD_DIR=board/starterkit/imx6sk-min

if grep -q "BR2_TARGET_UBOOT_WATCHDOG=y" .config; then
    install -m 0755 $BOARD_DIR/S15watchdog $1/etc/init.d/
else
    test -f $1/etc/init.d/S15watchdog && rm $1/etc/init.d/S15watchdog
fi

install -m 0755 $BOARD_DIR/S03led $1/etc/init.d/
install -m 0755 $BOARD_DIR/S04gsm $1/etc/init.d/
install -m 0755 $BOARD_DIR/S45rus $1/etc/init.d/
install -m 0644 $BOARD_DIR/interfaces $1/etc/network/
install -m 0644 $BOARD_DIR/vsftpd.conf $1/etc/
install -m 0644 $BOARD_DIR/inittab_nano_plc $1/etc/inittab
install -m 0644 $BOARD_DIR/vsftpd.conf $1/etc/
test -f $1/etc/ssh/sshd_config && sed -i 's/^.*UseDNS.*$/UseDNS no/g' $1/etc/ssh/sshd_config
test -f $1/etc/ssh/sshd_config && sed -i 's/^.*PermitRootLogin.*$/PermitRootLogin yes/g' $1/etc/ssh/sshd_config
rm $1/etc/resolv.conf
echo "nameserver 8.8.8.8" > $1/etc/resolv.conf
echo "nameserver 4.2.2.4" >> $1/etc/resolv.conf
echo "SK-iMX6ULL" > $1/etc/hostname

install -m 0755 $BOARD_DIR/can_test.sh $1/root/
install -m 0755 $BOARD_DIR/rs485_test.sh $1/root/

install -m 0644 $BOARD_DIR/mdev.conf $1/etc/
install -m 0755 $BOARD_DIR/auto_mount $1/bin/

mkdir -p $1/etc/ppp
install -m 0644 $BOARD_DIR/options-mobile $1/etc/ppp/
install -m 0644 $BOARD_DIR/utel.chat $1/etc/ppp/
install -m 0755 $BOARD_DIR/gprs_connect.sh $1/root/

mkdir -p $1/etc/gpio-scripts
install -m 0755 $BOARD_DIR/modem_ring_gpio_event $1/etc/gpio-scripts/52
install -m 0644 $BOARD_DIR/welcome.mp3 $1/root/
install -m 0755 $BOARD_DIR/S95gpiowatch $1/etc/init.d/

install -m 0755 $BOARD_DIR/gsm_pwr_off.sh $1/root/
install -m 0755 $BOARD_DIR/gsm_pwr_on.sh $1/root/
install -m 0755 $BOARD_DIR/gsm_test.sh $1/root/


