################################################################################
#
# linphone4
#
################################################################################

LINPHONE4_VERSION = 4.4.8
LINPHONE4_SITE = \
	https://gitlab.linphone.org/BC/public/liblinphone/-/archive/$(LINPHONE4_VERSION)
LINPHONE4_CONF_OPTS = \
	-DENABLE_ADVANCED_IM=OFF \
	-DENABLE_CXX_WRAPPER=OFF \
	-DENABLE_DB_STORAGE=OFF \
	-DENABLE_LIME=OFF \
	-DENABLE_LIME_X3DH=OFF \
	-DENABLE_STRICT=OFF \
	-DENABLE_TOOLS=OFF \
	-DENABLE_TUTORIALS=OFF \
	-DENABLE_UNIT_TESTS=OFF \
	-DENABLE_VCARD=OFF \
	-DENABLE_VIDEO=OFF \
	-DGIT_EXECUTABLE=OFF
LINPHONE4_INSTALL_STAGING = YES
LINPHONE4_DEPENDENCIES = \
	belle-sip4 \
	belr4 \
	libxml2 \
	mediastreamer4 \
	sqlite \
	$(if $(BR2_PACKAGE_ZLIB),zlib)
LINPHONE4_LICENSE = GPL-3.0+
LINPHONE4_LICENSE_FILES = LICENSE.txt

ifeq ($(BR2_STATIC_LIBS),y)
LINPHONE4_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=OFF
else ifeq ($(BR2_SHARED_STATIC_LIBS),y)
LINPHONE4_CONF_OPTS += -DENABLE_STATIC=ON -DENABLE_SHARED=ON
else ifeq ($(BR2_SHARED_LIBS),y)
LINPHONE4_CONF_OPTS += -DENABLE_STATIC=OFF -DENABLE_SHARED=ON
endif

$(eval $(cmake-package))
