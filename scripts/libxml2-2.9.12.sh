#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libxml2
export VERSION=2.9.12
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://xmlsoft.org/sources/libxml2-2.9.12.tar.gz
export SOURCE=libxml2-2.9.12.tar.gz
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
export CFLAGS="$CFLAGS -I$SYSROOT/usr/include/python3.9"
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --disable-static \
            --with-history \
            --with-regexps \
            --with-python=$SYSROOT/usr/bin/python3 &&
make
# install
install
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
epilog
