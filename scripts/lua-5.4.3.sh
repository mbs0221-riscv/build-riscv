#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=lua
export VERSION=5.4.3
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://www.lua.org/ftp/lua-5.4.3.tar.gz
export SOURCE=lua-5.4.3.tar.gz
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
sed -i '9s/gcc/riscv64-unknown-linux-gnu-gcc/' src/Makefile
sed -i '14s/ar/riscv64-unknown-linux-gnu-ar/' src/Makefile
sed -i '15s/ranlib/riscv64-unknown-linux-gnu-ranlib/' src/Makefile
sed -i '13s#/usr/local#$(PREFIX)#' Makefile
# build
build
make -j$(nproc)
# install
install
export PREFIX=$BUILDROOT/usr
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
