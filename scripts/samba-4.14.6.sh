#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            https://www.samba.org/ftp/samba/samba-4.14.6.tar.gz
./configure --prefix=$SYSROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
make -j8
make install

epilog

