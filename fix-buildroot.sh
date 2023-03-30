#!/bin/sh

mkdir -p output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/
(
cd output
ln -sf host/arm-buildroot-linux-uclibcgnueabihf/sysroot staging
)

mkdir -p output/target/boot
mkdir -p output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include

(
cd output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include
ln -sf libnl3/netlink netlink
ln -sf webrtc_audio_processing/webrtc webrtc
)

mkdir -p ./downloads
if [ ! -d dl ]; then rm dl; fi
ln -sf downloads dl
(
cd downloads
[ ! -f speex-1.2.0.tar.gz ] && wget http://sources.buildroot.net/speex/speex-1.2.0.tar.gz
[ ! -f speexdsp-SpeexDSP-1.2.0.tar.gz ] && wget http://sources.buildroot.net/speexdsp/speexdsp-SpeexDSP-1.2.0.tar.gz
)

mkdir -p output/build/speexdsp-SpeexDSP-1.2.0/m4
touch output/build/speexdsp-SpeexDSP-1.2.0/.stamp_downloaded
mkdir -p output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/cmake/Mediastreamer2
cp -r EmergUnit/mediastreamer/* output/host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/lib/cmake/Mediastreamer2/
mkdir -p output/build/mediastreamer4-4.4.8
cp -r EmergUnit/mediastreamer/* output/build/mediastreamer4-4.4.8/
touch output/build/mediastreamer4-4.4.8/.stamp_downloaded
touch output/build/mediastreamer4-4.4.8/.stamp_extracted
touch output/build/mediastreamer4-4.4.8/.stamp_configured
touch output/build/mediastreamer4-4.4.8/.stamp_patched
touch output/build/mediastreamer4-4.4.8/.stamp_built
touch output/build/mediastreamer4-4.4.8/.stamp_staging_installed
touch output/build/mediastreamer4-4.4.8/.stamp_target_installed
mkdir -p output/target/usr/lib
cp EmergUnit/libmediastreamer.so.11 output/target/usr/lib/libmediastreamer.so.11
(
cd output/target/usr/lib/
ln -sf libmediastreamer.so.11 libmediastreamer.so
)
mkdir -p output/staging/usr/lib
cp EmergUnit/libmediastreamer.so.11 output/staging/usr/lib/libmediastreamer.so.11
(
cd output/staging/usr/lib/
ln -sf libmediastreamer.so.11 libmediastreamer.so
)





