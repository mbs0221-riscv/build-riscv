#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=htop
export VERSION=2.2.0
# Release:        1%{?dist}
# Group:          System
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz
export SOURCE=htop-2.2.0.tar.gz
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
export CPPFLAGS=-I$SYSROOT/include
export LDFLAGS=-L$SYSROOT/lib
./configure --prefix=$BUILDROOT/usr           \
            --disable-unicode                    \
            --host=riscv64-unknown-linux-gnu     &&
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
