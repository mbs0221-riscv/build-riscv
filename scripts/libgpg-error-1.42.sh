#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://gnupg.org/ftp/gcrypt/libgpg-error/libgpg-error-1.42.tar.bz2
./configure --prefix=$SYSROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
make -j8
make install

epilog

