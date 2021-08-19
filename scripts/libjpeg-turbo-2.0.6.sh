#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libjpeg-turbo
export VERSION=2.0.6
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://downloads.sourceforge.net/libjpeg-turbo/libjpeg-turbo-2.0.6.tar.gz
export SOURCE=libjpeg-turbo-2.0.6.tar.gz
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
mkdir -v build &&
cd       build &&
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
cmake -DCMAKE_BUILD_TYPE=Release \
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
