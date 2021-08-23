#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=x265
export VERSION=3.4
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://anduin.linuxfromscratch.org/BLFS/x265/x265_3.4.tar.gz
export SOURCE=x265_3.4.tar.gz
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
setup -n x265_3.4
test build || mkdir build
cd build
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
export LDFLAGS="$LDFLAGS -ldl"
cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr $BUILD/x265_3.4/source/
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
