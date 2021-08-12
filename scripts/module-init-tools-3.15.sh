#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            https://mirrors.edge.kernel.org/pub/linux/utils/kernel/module-init-tools/module-init-tools-3.15.tar.gz
export CC=riscv64-unknown-linux-gnu-gcc
./configure --prefix=$SYSROOT \
            --host=riscv64-unknown-linux-gnu \
            --enable-zlib &&
make -j8
make install

epilog

