#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=mpfr
export VERSION=4.0.1
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://www.mpfr.org/mpfr-4.0.1/mpfr-4.0.1.tar.xz
export SOURCE=mpfr-4.0.1.tar.xz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# ./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu --with-gmp=$SYSROOT/usr --enable-shared
# make -j$(nproc) prefix=$SYSROOT/usr && make install prefix=$SYSROOT/usr
# pre
prep
# setup
setup
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-gmp=$SYSROOT/usr \
            --enable-shared
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
epilog
