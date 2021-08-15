#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
source ../build-utils.sh
export NAME=mbedtls
export VERSION=3.0.0
# Release:        1%{?dist}
# Summary:        A hello world program
# License:        GPLv3+
export URL=https://github.com/ARMmbed/mbedtls/archive/refs/tags/v3.0.0.tar.gz
export SOURCE=v3.0.0.tar.gz
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
export CC=riscv64-unknown-linux-gnu-gcc
mkdir build &&
cd build &&
cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr/local/ \
      -DUSE_SHARED_MBEDTLS_LIBRARY=On ../
make -j$(nproc)
# install
install
cd build
make install
# clean
clean

# %files
# path: /usr/local/
# %defattr(-,root,root,-)
epilog
