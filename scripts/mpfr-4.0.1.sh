#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            http://www.mpfr.org/mpfr-4.0.1/mpfr-4.0.1.tar.xz
# ./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu --with-gmp=$SYSROOT/usr --enable-shared
# make -j8 prefix=$SYSROOT/usr && make install prefix=$SYSROOT/usr 
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-gmp=$SYSROOT/usr \
            --enable-shared
make -j8
make install

epilog

