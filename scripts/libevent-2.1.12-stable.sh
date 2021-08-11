#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
sed -i s/python/&3/ event_rpcgen.py
./configure --prefix=$SYSROOT/usr                     
            --host=riscv64-unknown-linux-gnu               
            --enable-shared                                &&
make -j8
make install
