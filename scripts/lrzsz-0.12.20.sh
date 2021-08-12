#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://src.fedoraproject.org/repo/pkgs/lrzsz/lrzsz-0.12.20.tar.gz/b5ce6a74abc9b9eb2af94dffdfd372a4/lrzsz-0.12.20.tar.gz
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
export STRIP=riscv64-unknown-linux-gnu-strip
./configure --host=riscv64-unknown-linux-gnu           \
            --prefix=$SYSROOT/usr/local
make -j8
make install

epilog

