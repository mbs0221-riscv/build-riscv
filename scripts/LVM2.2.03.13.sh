#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=LVM
export VERSION=2.2.03.13
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://mirrors.kernel.org/sourceware/lvm2/LVM2.2.03.13.tgz
export SOURCE=LVM2.2.03.13.tgz
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
setup -n LVM2.2.03.13
PKG_CONFIG_PATH=$SYSROOT/lib/pkgconfig:$PKG_CONFIG_PATH
PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH
./configure --prefix=$BUILDROOT/usr \
            --host=riscv64-unknown-linux-gnu
sed -i "753s#^#//#" include/configure.h # //#define  malloc  rpl_malloc
sed -i "765s#^#//#" include/configure.h # //#define  realloc rpl_realloc
# build
build
make clean
make device-mapper -j$(nproc)
# install
install
make install_device-mapper
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
