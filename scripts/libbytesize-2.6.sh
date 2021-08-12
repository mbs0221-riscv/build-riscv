#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://github.com/storaged-project/libbytesize/releases/download/2.6/libbytesize-2.6.tar.gz
./configure --prefix=$SYSROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
make -j$(nproc)
make install

epilog

