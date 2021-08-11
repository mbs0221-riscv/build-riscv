#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.2.tar.bz2
libtirpc.so
provides the Remote Procedure Call (RPC) API functions required by other programs.
./configure --prefix=$SYSROOT/usr 
            --host=riscv64-unknown-linux-gnu 
            --disable-gssapi 
            --enable-shared
make -j8
make install
