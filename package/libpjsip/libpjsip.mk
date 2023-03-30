################################################################################
#
# libpjsip
#
################################################################################

LIBPJSIP_VERSION = 2.6
LIBPJSIP_SOURCE = pjproject-$(LIBPJSIP_VERSION).tar.bz2
LIBPJSIP_SITE = http://www.pjsip.org/release/$(LIBPJSIP_VERSION)
LIBPJSIP_DEPENDENCIES = libsrtp
LIBPJSIP_LICENSE = GPL-2.0+
LIBPJSIP_LICENSE_FILES = COPYING
LIBPJSIP_INSTALL_STAGING = YES
LIBPJSIP_MAKE = $(MAKE1)

LIBPJSIP_CFLAGS = $(TARGET_CFLAGS) -DPJ_HAS_IPV6=1

# relocation truncated to fit: R_68K_GOT16O
ifeq ($(BR2_m68k_cf),y)
LIBPJSIP_CFLAGS += -mxgot
endif

LIBPJSIP_CONF_ENV = \
	LD="$(TARGET_CC)" \
	CFLAGS="$(LIBPJSIP_CFLAGS)"

LIBPJSIP_CONF_OPTS = \
	--with-external-srtp \
	--disable-libwebrtc \
	--disable-ssl \
	--disable-oss \
	--disable-video \
	--disable-v4l2 \
	--disable-gsm-codec \
	--with-external-webrtc \

# Note: aconfigure.ac is broken: --enable-epoll or --disable-epoll will
# both enable it. But that's OK, epoll is better than the alternative,
# so we want to use it.
LIBPJSIP_CONF_OPTS += --enable-epoll \

ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)
LIBPJSIP_DEPENDENCIES += util-linux
endif

define LIBPJSIP_BUILD_DEP
	$(LIBPJSIP_MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) dep && $(LIBPJSIP_MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) clean
endef
LIBPJSIP_PRE_BUILD_HOOKS += LIBPJSIP_BUILD_DEP

LIBPJSIP_DEPENDENCIES += opus libsrtp

$(eval $(autotools-package))
