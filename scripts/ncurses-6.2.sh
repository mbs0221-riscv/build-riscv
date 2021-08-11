#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            http://ftp.gnu.org/pub/gnu/ncurses/ncurses-6.2.tar.gz
#./configure --prefix=$ROOTFS --host=riscv64-unknown-linux-gnu --without-cxx --without-cxx-binding --without-ada --without-progs --without-tests --with-shared
./configure --prefix=$SYSROOT 
            --host=riscv64-unknown-linux-gnu 
            --without-cxx 
            --without-cxx-binding 
            --without-ada 
            --without-progs 
            --without-tests 
            --with-shared &&
make -j8
make install
