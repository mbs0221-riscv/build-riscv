#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://sourceforge.net/projects/ltp/files/Coverage%20Analysis/LCOV-1.15/lcov-1.15.tar.gz
export CC=riscv64-unknown-linux-gnu-gcc
make clean && make
export DESTDIR=$SYSROOT
make install

epilog

