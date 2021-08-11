#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://github.com/libffi/libffi/releases/download/v3.4.2/libffi-3.4.2.tar.gz
./configure --prefix=$SYSROOT/usr/local 
            --host=riscv64-unknown-linux-gnu 
            --enable-shared 
            --with-sysroot &&
make -j8
make install
