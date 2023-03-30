################################################################################
#
# ortp4
#
################################################################################

ORTP4_VERSION = 4.4.8
ORTP4_SITE = https://gitlab.linphone.org/BC/public/ortp/-/archive/$(ORTP4_VERSION)
ORTP4_LICENSE = GPL-3.0+
ORTP4_LICENSE_FILES = LICENSE.txt
ORTP4_INSTALL_STAGING = YES
ORTP4_DEPENDENCIES = bctoolbox4
ORTP4_CONF_OPTS = \
	-DENABLE_DOC=OFF \
	-DENABLE_STRICT=OFF

ifeq ($(BR2_STATIC_LIBS),y)
ORTP4_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
ORTP4_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=ON
else ifeq ($(BR2_SHARED_LIBS),y)
ORTP4_CONF_OPTS += -DENABLE_STATIC=OFF -DENABLE_SHARED=ON
endif

$(eval $(cmake-package))
