#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=openssl
export VERSION=1.1.1k
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.openssl.org/source/openssl-1.1.1k.tar.gz
export SOURCE=openssl-1.1.1k.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export STRIP=riscv64-unknown-linux-gnu-strip
export PLATFORM=riscv64gc
#./config no-asm --prefix=$ROOTFS/usr --shared
./config no-asm --prefix=$SYSROOT/usr        \
                --shared                          \
sed -i 's/-m64//g' Makefile
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
