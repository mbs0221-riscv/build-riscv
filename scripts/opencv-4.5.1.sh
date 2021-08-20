#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=opencv
export VERSION=4.5.1
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/opencv/opencv/archive/4.5.1/opencv-4.5.1.tar.gz
export SOURCE=opencv-4.5.1.tar.gz
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
      -DENABLE_CXX11=ON                \
      -DBUILD_PERF_TESTS=OFF           \
      -DWITH_XINE=ON                   \
      -DBUILD_TESTS=OFF                \
      -DENABLE_PRECOMPILED_HEADERS=OFF \
      -DCMAKE_SKIP_RPATH=ON            \
      -DBUILD_WITH_DEBUG_INFO=OFF      \
      -Wno-dev  ..
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
