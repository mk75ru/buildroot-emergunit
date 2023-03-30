################################################################################
#
# webrtc-audio-processing
#
################################################################################

WEBRTC_AUDIO_PROCESSING_VERSION = 0.3
WEBRTC_AUDIO_PROCESSING_SOURCE = webrtc-audio-processing-$(WEBRTC_AUDIO_PROCESSING_VERSION).tar.xz
WEBRTC_AUDIO_PROCESSING_SITE = http://freedesktop.org/software/pulseaudio/webrtc-audio-processing
WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING = YES
WEBRTC_AUDIO_PROCESSING_LICENSE = BSD-3-Clause
WEBRTC_AUDIO_PROCESSING_LICENSE_FILES = COPYING
# 0001-configure.ac-fix-architecture-detection.patch
# 0002-Proper-detection-of-cxxabi.h-and-execinfo.h.patch
WEBRTC_AUDIO_PROCESSING_AUTORECONF = YES

WEBRTC_AUDIO_PROCESSING_CONF_OPTS += --with-ns-mode=fixed

define WEBRTC_AUDIO_PROCESSING_INSTALL_STAGING_CMDS_append

	$(INSTALL) -m 755 -D -d $(STAGING_DIR)/usr/lib/
	$(INSTALL) -m 755 -D -d $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc
	$(INSTALL) -m 755 -D -d $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/base
	$(INSTALL) -m 755 -D -d $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/common_audio/signal_processing/include
	$(INSTALL) -m 755 -D -d $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/include
	$(INSTALL) -m 755 -D -d $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/aecm/include
	$(INSTALL) -m 755 -D -d $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/aec/include
	$(INSTALL) -m 755 -D -d $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/ns/include
	$(INSTALL) -m 755 -D -d $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/beamformer
	$(INSTALL) -m 755 -D -d $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/interface
	$(INSTALL) -m 755 -D -d $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/system_wrappers/include

	$(INSTALL) -m 755 -D $(@D)/webrtc/base/arraysize.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/base/arraysize.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/base/basictypes.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/base/basictypes.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/base/checks.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/base/checks.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/base/constructormagic.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/base/constructormagic.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/base/maybe.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/base/maybe.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/base/platform_file.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/base/platform_file.h 
	$(INSTALL) -m 755 -D $(@D)/webrtc/common.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/common.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/common_audio/ring_buffer.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/common_audio/ring_buffer.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/common_audio/signal_processing/include/real_fft.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/common_audio/signal_processing/include/real_fft.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/common_audio/signal_processing/include/signal_processing_library.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/common_audio/signal_processing/include/signal_processing_library.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/common_audio/signal_processing/include/spl_inl.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/common_audio/signal_processing/include/spl_inl.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/common_audio/signal_processing/include/spl_inl_armv7.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/common_audio/signal_processing/include/spl_inl_armv7.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/common_audio/signal_processing/include/spl_inl_mips.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/common_audio/signal_processing/include/spl_inl_mips.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/common_types.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/common_types.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/modules/audio_processing/aec/aec_core.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/aec/aec_core.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/modules/audio_processing/aec/include/echo_cancellation.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/aec/include/echo_cancellation.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/modules/audio_processing/aecm/aecm_core.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/aecm/aecm_core.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/modules/audio_processing/aecm/aecm_defines.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/aecm/aecm_defines.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/modules/audio_processing/aecm/include/echo_control_mobile.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/aecm/include/echo_control_mobile.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/modules/audio_processing/beamformer/array_util.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/beamformer/array_util.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/modules/audio_processing/include/audio_processing.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/include/audio_processing.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/modules/audio_processing/ns/include/noise_suppression.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/ns/include/noise_suppression.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/modules/audio_processing/ns/include/noise_suppression_x.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/ns/include/noise_suppression_x.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/modules/audio_processing/ns/ns_core.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/audio_processing/ns/ns_core.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/modules/interface/module_common_types.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/modules/interface/module_common_types.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/system_wrappers/include/trace.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/system_wrappers/include/trace.h
	$(INSTALL) -m 755 -D $(@D)/webrtc/typedefs.h $(STAGING_DIR)/usr/include/webrtc_audio_processing/webrtc/typedefs.h

endef

$(eval $(autotools-package))
