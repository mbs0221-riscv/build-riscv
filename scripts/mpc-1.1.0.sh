#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=mpc
export VERSION=1.1.0
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz
export SOURCE=mpc-1.1.0.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# ./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu --with-mpfr=$SYSROOT/usr --with-gmp=$SYSROOT/usr --enable-shared
# make -j$(nproc) prefix=$SYSROOT/usr && make install prefix=$SYSROOT/usr
# pre
prep
# setup
setup
#export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-mpfr=$SYSROOT/usr \
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
