#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=rpm
export VERSION=4.16.1.3
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://ftp.osuosl.org/pub/rpm/releases/rpm-4.16.x/rpm-4.16.1.3.tar.bz2
export SOURCE=rpm-4.16.1.3.tar.bz2
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH
export PYTHON_CFLAGS=-I$SYSROOT/usr/include/python3.9
export PYTHON_LIBS=-L$SYSROOT/usr/lib/python3.9
./configure --prefix=$SYSROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
            --enable-python \
            --enable-sqlite=yes \
            --enable-shared \
            --without-lua
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
