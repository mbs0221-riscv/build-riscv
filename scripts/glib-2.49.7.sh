#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=glib
export VERSION=2.49.7
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://download-fallback.gnome.org/sources/glib/2.49/glib-2.49.7.tar.xz
export SOURCE=glib-2.49.7.tar.xz
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
export CFLAGS="-Wformat-overflow"
echo glib_cv_stack_grows=no >> riscv64-unknown-linux.cache
echo glib_cv_uscore=no >> riscv64-unknown-linux.cache
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --enable-iconv=no \
            --with-libiconv=gnu \
            --with-pcre=system \
            --disable-libelf \
            --cache-file=riscv64-unknown-linux.cache
# build
build
make -j$(nproc)
# install
install
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
