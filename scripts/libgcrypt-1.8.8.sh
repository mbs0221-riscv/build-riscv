#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://gnupg.org/ftp/gcrypt/libgcrypt/libgcrypt-1.8.8.tar.bz2
./configure --prefix=$SYSROOT/usr/ 
            --host=riscv64-unknown-linux-gnu 
            --with-sysroot=$SYSROOT 
            --with-libgpg-error-prefix=$SYSROOT/usr
make -j8
make install
