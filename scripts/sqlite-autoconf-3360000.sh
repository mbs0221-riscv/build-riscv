#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            url
./configure --prefix=$SYSROOT/usr/local/ \
            --host=riscv64-unknown-linux-gnu
make -j8
make install

epilog
