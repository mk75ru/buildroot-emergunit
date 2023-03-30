################################################################################
#
# emergunit
#
################################################################################

EMERGUNIT_VERSION = 0.1
EMERGUNIT_SOURCE = emergunit-$(EMERGUNIT_VERSION).tar.xz
EMERGUNIT_SITE = $(TOPDIR)/EmergUnit
EMERGUNIT_SITE_METHOD = file
EMERGUNIT_DEPENDENCIES = qt5base libwt libnl alsa-lib
EMERGUNIT_LICENSE = DWTFYWWI
EMERGUNIT_LICENSE_FILES = LICENSE

ifeq ($(BR2_PACKAGE_LINPHONE),y)
EMERGUNIT_DEPENDENCIES += linphone
endif

ifeq ($(BR2_PACKAGE_LINPHONE4),y)
EMERGUNIT_DEPENDENCIES += linphone4
endif

define EMERGUNIT_INSTALL_TARGET_CMDS
	$(INSTALL) -m 755 -D -d $(TARGET_DIR)/etc
	$(INSTALL) -m 755 -D -d $(TARGET_DIR)/home/root/Lib
	$(INSTALL) -m 755 -D -d $(TARGET_DIR)/home/root/Bin
	$(INSTALL) -m 755 -D -d $(TARGET_DIR)/home/root/Scripts
	$(INSTALL) -m 755 -D -d $(TARGET_DIR)/home/root/Sound
	$(INSTALL) -m 755 -D -d $(TARGET_DIR)/home/root/Wtgui/approot
	$(INSTALL) -m 755 -D -d $(TARGET_DIR)/home/root/Wtgui/docroot/pics
	$(INSTALL) -m 755 -D -d $(TARGET_DIR)/home/root/Wtgui/docroot/style

	$(INSTALL) -m 755 -D $(@D)/Files/asound.conf		$(TARGET_DIR)/etc/asound.conf
	$(INSTALL) -m 755 -D $(@D)/Files/sip-emergunit.cfg	$(TARGET_DIR)/home/root/Conf/sip-emergunit.cfg
	$(INSTALL) -m 755 -D $(@D)/Files/static-net.cfg		$(TARGET_DIR)/home/root/Conf/static-net.cfg
	#$(INSTALL) -m 755 -D $(@D)/Files/RunTimeScripts/*	$(TARGET_DIR)/home/root/Scripts/
	$(INSTALL) -m 755 -D $(@D)/build/usr/lib/* 			$(TARGET_DIR)/home/root/Lib/
	$(INSTALL) -m 755 -D $(@D)/build/usr/bin/*			$(TARGET_DIR)/home/root/Bin/
	$(INSTALL) -m 755 -D $(@D)/wtgui/src/wrc/approot/*			$(TARGET_DIR)/home/root/Wtgui/approot/
	$(INSTALL) -m 755 -D $(@D)/wtgui/src/wrc/docroot/pics/*		$(TARGET_DIR)/home/root/Wtgui/docroot/pics/
	$(INSTALL) -m 755 -D $(@D)/wtgui/src/wrc/docroot/style/*	$(TARGET_DIR)/home/root/Wtgui/docroot/style/
	$(INSTALL) -m 755 -D $(@D)/Files/busy.wav			$(TARGET_DIR)/home/root/Sound/
	$(INSTALL) -m 755 -D $(@D)/Files/speak.wav			$(TARGET_DIR)/home/root/Sound/
endef

define EMERGUNIT_INSTALL_INIT_SYSV
	$(INSTALL) -m 755 -D $(@D)/Files/emergunit-startup.sh		$(TARGET_DIR)/etc/init.d/S99emergunit-startup
	$(INSTALL) -m 755 -D $(@D)/Files/emergunit-interfaces.sh	$(TARGET_DIR)/etc/init.d/S02emergunit-startup
endef

$(eval $(qmake-package))
