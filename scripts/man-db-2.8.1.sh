#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=man-db
export VERSION=2.8.1
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://download.savannah.gnu.org/releases/man-db/man-db-2.8.1.tar.xz
export SOURCE=man-db-2.8.1.tar.xz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
# require libpipeline
export PKG_CONFIG_PATH=$SYSROOT/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
            --exec-prefix=$SYSROOT/usr/local \
            --host=riscv64-unknown-linux-gnu \
            --with-gzip=GZIP \
            --with-bzip2=BZIP2 \
            --with-xz=XZ \
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
