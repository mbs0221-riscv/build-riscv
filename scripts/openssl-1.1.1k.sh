#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://www.openssl.org/source/openssl-1.1.1k.tar.gz
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export STRIP=riscv64-unknown-linux-gnu-strip
export PLATFORM=riscv64gc
#./config no-asm --prefix=$ROOTFS/usr --shared
./config no-asm --prefix=$SYSROOT/usr        \
                --shared                          \
                
sed -i 's/-m64//g' Makefile
make -j8
make install

epilog

