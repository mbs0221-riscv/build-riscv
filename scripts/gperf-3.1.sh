#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            http://ftp.gnu.org/pub/gnu/gperf/gperf-3.1.tar.gz
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
export RANLIB=riscv64-unknown-linux-gnu-ranlib
export STRIP=riscv64-unknown-linux-gnu-strip
./configure --prefix=$SYSROOT/usr/local/   \
            --host=riscv64-unknown-linux-gnu    &&
make -j8
           
make install

epilog

