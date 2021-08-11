#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            http://www.zlib.net/zlib-1.2.11.tar.gz
export CROSS_PREFIX=riscv64-unknown-linux-gnu-
export PLATFORM=riscv64gc
./configure --prefix=$SYSROOT/usr
make -j8
make install

epilog

