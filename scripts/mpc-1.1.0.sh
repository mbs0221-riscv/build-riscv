#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz
# ./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu --with-mpfr=$SYSROOT/usr --with-gmp=$SYSROOT/usr --enable-shared
# make -j8 prefix=$SYSROOT/usr && make install prefix=$SYSROOT/usr
#export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-mpfr=$SYSROOT/usr \
            --with-gmp=$SYSROOT/usr \
            --enable-shared
make -j8
make install

epilog

