#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libav
export VERSION=12.3
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://libav.org/releases/libav-12.3.tar.gz
export SOURCE=libav-12.3.tar.gz
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
#export CC=afl-clang-fast
#export CFLAGS="--gcc-toolchain=$TOOLCHAIN --sysroot=$SYSROOT --target=$TARGET -march=$MARCH -fPIC"
./configure --prefix=$BUILDROOT/usr \
            --cross-prefix=riscv64-unknown-linux-gnu- \
            --enable-cross-compile \
            --arch=rv64gc \
            --target-os=linux
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
