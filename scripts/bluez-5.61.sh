#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=bluez
export VERSION=5.61
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://www.kernel.org/pub/linux/bluetooth/bluez-5.61.tar.xz
export SOURCE=bluez-5.61.tar.xz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
post
# pre
prep
# setup
setup
PKG_CONFIG_PATH=$SYSROOT/lib/pkgconfig:$PKG_CONFIG_PATH
PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH
export LIBS="-lreadline -ltinfo -ljson-c"
./configure --prefix=/usr \
            --host=riscv64-unknown-linux-gnu \
            --enable-debug \
            --enable-threads \
            --enable-backtrace \
            --enable-library \
            --enable-test \
            --enable-nfc \
            --enable-sap \
            --enable-health \
            --enable-mesh \
            --enable-btpclient \
            --enable-testing \
            --enable-sixaxis \
            --enable-hid2hci \
            --enable-logger \
            --enable-admin \
            --disable-systemd \
            --disable-udev \
# build
build
make -j$(nproc)
# install
install
make install DESTDIR=$BUILDROOT
# clean
clean

# %files
# path: /
# %defattr(-,root,root,-)
# %config
# %doc
epilog
