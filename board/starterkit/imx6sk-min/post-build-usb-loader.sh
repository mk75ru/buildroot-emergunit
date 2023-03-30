BOARD_DIR=board/starterkit/imx6sk-min

eval $(grep "BR2_TARGET_UBOOT_BOARD_DEFCONFIG" .config)

case "$BR2_TARGET_UBOOT_BOARD_DEFCONFIG" in
  sk_imx6ull_lcd_mb)
        INITTAB=inittab_usb_loader_mb
        ;;
  sk_imx6ull_mb)
        INITTAB=inittab_usb_loader_mb
        ;;
  sk_imx6ull_sb)
        INITTAB=inittab_usb_loader_sb
        ;;
  *)
        echo "Unknown board"
        exit 1
esac

install -m 0644 $BOARD_DIR/$INITTAB $1/etc/inittab
