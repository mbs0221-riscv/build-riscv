#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=eigen
export VERSION=3.3.9
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://gitlab.com/libeigen/eigen/-/archive/3.3.9/eigen-3.3.9.tar.gz
export SOURCE=eigen-3.3.9.tar.gz
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
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
test -d build || mkdir -v build
cd build &&
cmake -DCMAKE_BUILD_TYPE=Release \
# Group:          Library
      -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr \
      -DBUILD_STATIC_LIBS=OFF ..
# build
build
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
