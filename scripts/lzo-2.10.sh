#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://www.oberhumer.com/opensource/lzo/download/lzo-2.10.tar.gz
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
       	    --enable-shared                  \
       	    --disable-static                 \
       	    --docdir=$SYSROOT/usr/share/doc/lzo-2.10
make -j$(nproc)
make install

epilog

