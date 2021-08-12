#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://data.iana.org/time-zones/releases/tzdb-2021a.tar.lz
export DESTDIR=$SYSROOT
export CC=riscv64-unknown-linux-gnu-gcc
make -j$(nproc) 
make install DESTDIR=$SYSROOT

epilog

