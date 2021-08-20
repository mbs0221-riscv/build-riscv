#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=brotli
export VERSION=1.0.9
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/google/brotli/archive/v1.0.9/brotli-1.0.9.tar.gz
export SOURCE=brotli-1.0.9.tar.gz
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
sed -i 's@-R..libdir.@@' scripts/*.pc.in
test -d build || mkdir build
cd build
cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr -DCMAKE_BUILD_TYPE=Release ..
# Group:          Library
# build
build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
cd build
make -j$(nproc)
# install
install
cd build
make install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
