#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=scute
export VERSION=1.7.0
# Release:        1%{?dist}
# Group:          GnuPG
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.gnupg.org/ftp/gcrypt/scute/scute-1.7.0.tar.bz2
export SOURCE=scute-1.7.0.tar.bz2
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
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-libgpg-error-prefix=$SYSROOT/usr \
            --with-libassuan-prefix=$SYSROOT/usr
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
