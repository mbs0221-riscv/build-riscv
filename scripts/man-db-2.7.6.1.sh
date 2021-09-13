#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=man-db
export VERSION=2.7.6.1
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://download.savannah.gnu.org/releases/man-db/man-db-2.7.6.1.tar.xz
export SOURCE=man-db-2.7.6.1.tar.xz
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
export PKG_CONFIG_PATH=$SYSROOT/usr//lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
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
