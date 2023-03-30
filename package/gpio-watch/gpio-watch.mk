################################################################################
#
# gpio-watch
#
################################################################################

GPIO_WATCH_VERSION = 570f56ca42ad9b4e93f3e9207ee2b763897470b2
GPIO_WATCH_SITE = $(call github,larsks,gpio-watch,$(GPIO_WATCH_VERSION))
GPIO_WATCH_LICENSE = GPL-2.0

define GPIO_WATCH_BUILD_CMDS
	$(MAKE) -C $(@D) $(TARGET_CONFIGURE_OPTS)
endef

define GPIO_WATCH_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/gpio-watch $(TARGET_DIR)/usr/sbin/gpio-watch
endef

$(eval $(generic-package))
