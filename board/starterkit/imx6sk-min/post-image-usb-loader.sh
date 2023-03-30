BOARD_DIR=board/starterkit/imx6sk-min
eval $(grep "BR2_TARGET_UBOOT_BOARD_DEFCONFIG" .config)

case "$BR2_TARGET_UBOOT_BOARD_DEFCONFIG" in
  sk_imx6ull_lcd_mb)
        DTB=imx6ull-sk-lcd-mb
        ;;
  sk_imx6ull_mb)
        DTB=imx6ull-sk-mb
        ;;
  sk_imx6ull_sb)
        DTB=imx6ull-sk-sb
        ;;
  *)
        echo "Unknown board"
        exit 1
esac

dd if=output/build/uboot-custom/u-boot-dtb.bin of=output/images/u-boot-dtb.bin.pad512k bs=512K count=1 conv=sync
cat output/images/u-boot-dtb.bin.pad512k output/images/zImage.${DTB} > output/images/uboot_zImage.imx6ull-sk
output/build/uboot-custom/tools/mkimage -n output/build/uboot-custom/board/starterkit/${BR2_TARGET_UBOOT_BOARD_DEFCONFIG}/imximage.cfg.cfgtmp \
    -T imximage -e 0x87800000 -d output/images/uboot_zImage.imx6ull-sk output/images/uImage.imx6ull
