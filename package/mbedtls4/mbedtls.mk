################################################################################
#
# mbedtls4
#
################################################################################

MBEDTLS4_VERSION = 2.16.10
MBEDTLS4_SITE = $(call github,ARMmbed,mbedtls,v$(MBEDTLS4_VERSION))
MBEDTLS4_CONF_OPTS = \
	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
	-DENABLE_TESTING=OFF
MBEDTLS4_INSTALL_STAGING = YES
MBEDTLS4_LICENSE = Apache-2.0
MBEDTLS4_LICENSE_FILES = apache-2.0.txt
MBEDTLS4_CPE_ID_VENDOR = arm
MBEDTLS4_CPE_ID_PRODUCT = mbed_tls

# This is mandatory for hiawatha
ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
define MBEDTLS4_ENABLE_THREADING
	$(SED) "s://#define MBEDTLS_THREADING_C:#define MBEDTLS_THREADING_C:" \
		$(@D)/include/mbedtls/config.h
	$(SED) "s://#define MBEDTLS_THREADING_PTHREAD:#define MBEDTLS_THREADING_PTHREAD:" \
		$(@D)/include/mbedtls/config.h
endef
MBEDTLS4_POST_PATCH_HOOKS += MBEDTLS4_ENABLE_THREADING
ifeq ($(BR2_STATIC_LIBS),y)
MBEDTLS4_CONF_OPTS += -DLINK_WITH_PTHREAD=ON
endif
endif

ifeq ($(BR2_STATIC_LIBS),y)
MBEDTLS4_CONF_OPTS += \
	-DUSE_SHARED_MBEDTLS_LIBRARY=OFF -DUSE_STATIC_MBEDTLS_LIBRARY=ON
else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
MBEDTLS4_CONF_OPTS += \
	-DUSE_SHARED_MBEDTLS_LIBRARY=ON -DUSE_STATIC_MBEDTLS_LIBRARY=ON
else ifeq ($(BR2_SHARED_LIBS),y)
MBEDTLS4_CONF_OPTS += \
	-DUSE_SHARED_MBEDTLS_LIBRARY=ON -DUSE_STATIC_MBEDTLS_LIBRARY=OFF
endif

ifeq ($(BR2_PACKAGE_MBEDTLS_COMPRESSION),y)
MBEDTLS4_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=ON
MBEDTLS4_DEPENDENCIES += zlib
define MBEDTLS4_ENABLE_ZLIB
	$(SED) "s://#define MBEDTLS_ZLIB_SUPPORT:#define MBEDTLS_ZLIB_SUPPORT:" \
		$(@D)/include/mbedtls/config.h
endef
MBEDTLS4_POST_PATCH_HOOKS += MBEDTLS4_ENABLE_ZLIB
else
MBEDTLS4_CONF_OPTS += -DENABLE_ZLIB_SUPPORT=OFF
endif

define MBEDTLS4_DISABLE_ASM
	$(SED) '/^#define MBEDTLS_AESNI_C/d' \
		$(@D)/include/mbedtls/config.h
	$(SED) '/^#define MBEDTLS_HAVE_ASM/d' \
		$(@D)/include/mbedtls/config.h
	$(SED) '/^#define MBEDTLS_PADLOCK_C/d' \
		$(@D)/include/mbedtls/config.h
endef

# ARM in thumb mode breaks debugging with asm optimizations
# Microblaze asm optimizations are broken in general
# MIPS R6 asm is not yet supported
ifeq ($(BR2_ENABLE_DEBUG)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_ARM_INSTRUCTIONS_THUMB2),yy)
MBEDTLS4_POST_CONFIGURE_HOOKS += MBEDTLS4_DISABLE_ASM
else ifeq ($(BR2_microblaze)$(BR2_MIPS_CPU_MIPS32R6)$(BR2_MIPS_CPU_MIPS64R6),y)
MBEDTLS4_POST_CONFIGURE_HOOKS += MBEDTLS4_DISABLE_ASM
endif

$(eval $(cmake-package))
