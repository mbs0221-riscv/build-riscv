#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=Python
export VERSION=2.7.18
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tar.xz
export SOURCE=Python-2.7.18.tar.xz
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
export CPPFLAGS="$CFLAGS -I$SYSROOT/usr/include -I$SYSROOT/usr/include/ncurses"
export LDFLAGS="$CFLAGS -L$SYSROOT/usr/lib"
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --build=riscv64 \
            --enable-shared \
            --disable-ipv6 \
            --enable-loadable-sqlite-extensions \
            --enable-optimizations \
            --enable-big-digits \
            --enable-unicode \
            --enable-profiling \
            --enable-universalsdk \
            --with-wctype-functions \
            --with-fpectl \
            --with-system-expat \
            --with-system-ffi \
            --with-signal-module \
            --with-lto \
            ac_cv_file__dev_ptc=no \
            ac_cv_file__dev_ptmx=no
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
