#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://download.samba.org/pub/ppp/ppp-2.4.9.tar.gz
./configure --prefix=$SYSROOT/usr/local \
            --sysconfdir=$SYSROOT/etc \
            --cc=riscv64-unknown-linux-gnu-gcc \
            --cross-compile=riscv64-unknown-linux-gnu \
            --sysconf=$SYSROOT/etc
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export STRIP=riscv64-unknown-linux-gnu-strip
make -j12
make install
make install-etcppp

epilog

