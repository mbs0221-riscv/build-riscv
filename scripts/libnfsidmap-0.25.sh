#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/libnfsidmap-0.25.tar.gz
./configure --prefix=$SYSROOT/usr                     \
            --host=riscv64-unknown-linux-gnu               \
            --enable-shared &&
make -j8
make install

epilog

