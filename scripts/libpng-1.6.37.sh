#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libpng
export VERSION=1.6.37
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://downloads.sourceforge.net/libpng/libpng-1.6.37.tar.xz
export SOURCE=libpng-1.6.37.tar.xz
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
test -f $SOURCES/libpng-1.6.37-apng.patch.gz || \
	wget --no-check-certificate https://downloads.sourceforge.net/sourceforge/libpng-apng/libpng-1.6.37-apng.patch.gz -P $SOURCES
gzip -cd $SOURCES/libpng-1.6.37-apng.patch.gz | patch -p1
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
# build
build
make -j$(nproc)
# install
install
make install
mkdir -v -p $SYSROOT/usr/share/doc/libpng-1.6.37 &&
cp -v README libpng-manual.txt $SYSROOT/usr/share/doc/libpng-1.6.37
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
