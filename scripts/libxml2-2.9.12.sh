#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            http://xmlsoft.org/sources/libxml2-2.9.12.tar.gz
export CFLAGS=$CFLAGS -I$SYSROOT/usr/include/python3.9
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
./configure --prefix=$SYSROOT/usr/local/ 
            --host=riscv64-unknown-linux-gnu 
            --disable-static 
            --with-history 
            --with-regexps 
            --with-python=$SYSROOT/usr/bin/python3 &&
make
make install
