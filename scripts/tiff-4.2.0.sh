#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=tiff
export VERSION=4.2.0
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=http://download.osgeo.org/libtiff/tiff-4.2.0.tar.gz
export SOURCE=tiff-4.2.0.tar.gz
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
      -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr \
      -DBUILD_STATIC_LIBS=OFF -G Ninja ..
# build
build
cd build
ninja
# install
install
cd build
ninja install
# clean
clean

# %files
# path: /usr
# %defattr(-,root,root,-)
# %config
# %doc
epilog
