#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=gnupg
export VERSION=2.2.29
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.gnupg.org/ftp/gcrypt/gnupg/gnupg-2.2.29.tar.bz2
export SOURCE=gnupg-2.2.29.tar.bz2
# Requires(post): info
# Requires(preun): info
# %description
# # A helloworld program from the packagecloud.io blog!
# pre
pre
# pre
post
# pre
prep
# setup
setup
export PKG_CONFIG_PATH=$SYSROOT/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-libgpg-error-prefix=$SYSROOT/usr \
            --with-libgcrypt-prefix=$SYSROOT/usr \
            --with-libassuan-prefix=$SYSROOT/usr \
            --with-ksba-prefix=$SYSROOT/usr \
            --with-npth-prefix=$SYSROOT/usr \
            --with-ntbtls-prefix=$SYSROOT/usr \
            --with-libiconv-prefix=$SYSROOT/usr
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
