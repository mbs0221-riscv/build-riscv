#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz
./configure --prefix=$SYSROOT/usr/ 
            --host=riscv64-unknown-linux-gnu 
make -j8
make install
# libtool --finish $SYSROOT/usr/lib
