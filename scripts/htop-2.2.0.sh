#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            http://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz
export CPPFLAGS=-I$SYSROOT/include
export LDFLAGS=-L$SYSROOT/lib
./configure --prefix=$SYSROOT/usr           
            --disable-unicode                    
            --host=riscv64-unknown-linux-gnu     &&
make -j8
make install
