################################################################################
#
# imx-test
#
################################################################################

IMX_TEST_SOURCE = rel_imx_4.9.x_1.0.0_ga.tar.bz2
IMX_TEST_SITE    = $(FREESCALE_IMX_SITE)
IMX_TEST_LICENSE = LGPLv2.1+

IMX_TEST_DEPENDENCIES += imx-lib
IMX_TEST_INCLUDE = \
	-I$(STAGING_DIR)/usr/include \
	-I$(@D)/include \
	-I$(LINUX_DIR)/include/uapi \
	-I$(LINUX_DIR)/include \
	-I$(LINUX_DIR)/arch/arm/include \
	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include

IMX_TEST_MAKE_ENV = \
	$(TARGET_MAKE_ENV) \
	$(TARGET_CONFIGURE_OPTS) \
	CFLAGS="$(TARGET_CFLAGS) -mfloat-abi=hard" \
	CROSS_COMPILE=$(TARGET_CROSS) V=1 \
	PLATFORM=IMX6UL \
	INC="$(IMX_TEST_INCLUDE)" \
	LINUXPATH=$(LINUX_DIR) \
	KBUILD_OUTPUT=$(LINUX_DIR)

define IMX_TEST_BUILD_CMDS
	$(IMX_TEST_MAKE_ENV) $(MAKE1) -C $(@D)
endef

define IMX_TEST_INSTALL_TARGET_CMDS
	$(INSTALL) -d $(TARGET_DIR)/imx-test
	$(INSTALL) -m 0755 $(@D)/platform/IMX6UL/* \
                $(TARGET_DIR)/imx-test
endef

$(eval $(generic-package))
