#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            https://github.com/libexpat/libexpat/releases/download/R_2_4_1/expat-2.4.1.tar.gz
./configure --prefix=$SYSROOT/usr/local \
            --host=riscv64-unknown-linux-gnu \
            --without-docbook
make -j8
make install

epilog

