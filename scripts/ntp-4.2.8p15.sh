#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            http://www.eecis.udel.edu/~ntp/ntp_spool/ntp4/ntp-4.2/ntp-4.2.8p15.tar.gz
./configure --prefix=$SYSROOT/usr/local               \
            --host=riscv64-unknown-linux-gnu               \
            --exec-prefix=$SYSROOT/usr/local          \
            --with-yielding-select=yes                     \
            --enable-shared                                &&
make -j8
make install

epilog

