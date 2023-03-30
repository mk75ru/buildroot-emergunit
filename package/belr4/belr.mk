################################################################################
#
# belr4
#
################################################################################

BELR4_VERSION = 4.4.8
BELR4_SITE = https://gitlab.linphone.org/BC/public/belr/-/archive/$(BELR4_VERSION)
BELR4_LICENSE = GPL-3.0+
BELR4_LICENSE_FILES = LICENSE.txt
BELR4_INSTALL_STAGING = YES
BELR4_DEPENDENCIES = bctoolbox4
BELR4_CONF_OPTS = \
	-DENABLE_STRICT=OFF \
	-DENABLE_TESTS=OFF \
	-DENABLE_TOOLS=OFF

ifeq ($(BR2_STATIC_LIBS),y)
BELR4_CONF_OPTS += -DENABLE_SHARED=OFF -DENABLE_STATIC=ON
else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
BELR4_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=ON
else ifeq ($(BR2_SHARED_LIBS),y)
BELR4_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_STATIC=OFF
endif

$(eval $(cmake-package))
