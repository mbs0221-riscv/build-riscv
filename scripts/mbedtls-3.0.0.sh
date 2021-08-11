#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://github.com/ARMmbed/mbedtls/archive/refs/tags/v3.0.0.tar.gz
export CC=riscv64-unknown-linux-gnu-gcc
mkdir build &&
cd build &&
cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr/local/ 
      -DUSE_SHARED_MBEDTLS_LIBRARY=On ../ 
make -j8
cd build
make install
