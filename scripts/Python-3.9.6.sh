#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            url
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
#export CFLAGS=$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses -I$SYSROOT/usr/local/include
#export LDFLAGS=$CFLAGS -L$SYSROOT/lib -L$SYSROOT/usr/local/lib
export CFLAGS=$CFLAGS -I$SYSROOT/include -I$SYSROOT/include/ncurses
export LDFLAGS=$CFLAGS -L$SYSROOT/lib
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
#./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu --build=riscv64 --enable-shared --disable-ipv6 --enable-loadable-sqlite-extensions --enable-optimizations ac_cv_file__dev_ptc=no  ac_cv_file__dev_ptmx=no && make -j8
./configure --prefix=$SYSROOT/usr 
            --host=riscv64-unknown-linux-gnu 
            --build=riscv64 
            --enable-shared 
            --disable-ipv6 
            --enable-loadable-sqlite-extensions 
            --enable-optimizations 
            ac_cv_file__dev_ptc=no 
            ac_cv_file__dev_ptmx=no &&
make -j8
#./configure --prefix=$SYSROOT/usr 
#            --host=riscv64-unknown-linux-gnu 
#            --build=riscv64 
#            --enable-shared 
#            --disable-ipv6 
#            --enable-loadable-sqlite-extensions 
#            --enable-optimizations 
#            ac_cv_file__dev_ptc=no 
#            ac_cv_file__dev_ptmx=no &&
#make -j8
make install
