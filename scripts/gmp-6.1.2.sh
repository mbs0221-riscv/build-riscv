#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            http://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
# ./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu
# make -j8 prefix=$SYSROOT/usr && make install prefix=$SYSROOT/usr
./configure --prefix=$SYSROOT/usr 
            --host=riscv64-unknown-linux-gnu 
make -j8
make install
