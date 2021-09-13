#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=libwebsockets
export VERSION=4.2.1
# Release:        1%{?dist}
# Group:          Library
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/warmcat/libwebsockets/archive/refs/tags/v4.2.1.tar.gz
export SOURCE=v4.2.1.tar.gz
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
#wget https://github.com/warmcat/libwebsockets/archive/refs/tags/v4.2.1.tar.gz
# setup
setup
test -d build || mkdir build
export CROSS_COMPILE=riscv64-unknown-linux-gnu
export INSTALL_PREFIX=$SYSROOT/usr
cd build
cmake .. \
    -DLWS_IPV6=YES \
    -DOPENSSL_INCLUDE_DIR=$SYSROOT/usr/include \
    -DOPENSSL_LIBRARIES=$SYSROOT/usr/lib \
    -DOPENSSL_ROOT_DIR=$SYSROOT/usr/lib \
    -DCMAKE_C_COMPILER=$CROSS_COMPILE-gcc \
    -DCMAKE_CXX_COMPILER=$CROSS_COMPILE-g++ \
    -DCMAKE_AR=$RISCV/bin/$CROSS_COMPILE-ar \
    -DCMAKE_RANLIB=$RISCV/bin/$CROSS_COMPILE-ranlib \
    -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX
# build
build
cd build
make
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
