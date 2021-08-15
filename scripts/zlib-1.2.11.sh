#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=zlib
export VERSION=1.2.11
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://www.zlib.net/zlib-1.2.11.tar.gz
export SOURCE=zlib-1.2.11.tar.gz
# Requires(post): info
# Requires(preun): info
# %description
# A helloworld program from the packagecloud.io blog!
# pre
prep
# setup
setup
export CROSS_PREFIX=riscv64-unknown-linux-gnu-
export PLATFORM=riscv64gc
./configure --prefix=$SYSROOT/usr
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
