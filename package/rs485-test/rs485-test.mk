################################################################################
#
# rs485-test
#
################################################################################

RS485_TEST_VERSION = test
RS485_TEST_SOURCE = rs485-$(RS485_TEST_VERSION).tar.gz
RS485_TEST_SITE = $(DL_DIR)
RS485_TEST_LICENSE = GPL-2.0

define RS485_TEST_BUILD_CMDS
	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
endef

define RS485_TEST_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/rs485_test $(TARGET_DIR)/usr/bin/rs485_test
endef

$(eval $(generic-package))
