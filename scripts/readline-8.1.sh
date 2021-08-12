#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://ftp.gnu.org/gnu/readline/readline-8.1.tar.gz
./configure --prefix=$SYSROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
make -j$(nproc)
make install

epilog

