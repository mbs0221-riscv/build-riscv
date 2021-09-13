#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=systemd
export VERSION=232
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://anduin.linuxfromscratch.org/sources/other/systemd/systemd-232.tar.xz
export SOURCE=systemd-232.tar.xz
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
export PKG_CONFIG_PATH=$SYSROOT/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/lib64/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
#export LDFLAGS="$LDFLAGS -L$SYSROOT/lib64 -L$SYSROOT/usr/lib"
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --sysconfdir=/etc \
            --libdir=/usr/lib \
            --enable-securedir=/lib/security \
            --docdir=/usr/share/doc/Linux-PAM-1.1.8
# build
build
export CFLAGS="$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses -I$SYSROOT/usr/include -I$SYSROOT/usr/include"
export LDFLAGS="$LDFLAGS -L$SYSROOT/lib -L$SYSROOT/usr/lib"
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
