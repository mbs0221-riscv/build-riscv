#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            https://ftp.osuosl.org/pub/blfs/conglomeration/libarchive/libarchive-3.5.1.tar.xz
./configure --prefix=$SYSROOT/usr/local \
            --host=riscv64-unknown-linux-gnu \
make -j8
make install

epilog

