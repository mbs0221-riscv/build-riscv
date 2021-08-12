#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source ../build-utils.sh

parse_url            http://www.cpan.org/src/5.0/perl-5.26.1.tar.xz
export export LD_LIBRARY_PATH=$SYSROOT/lib:$SYSROOT/usr/lib:$SYSROOT/usr/local/lib$LD_LIBRARY_PATH
sh Configure -Dcc=riscv64-unknown-linux-gnu-gcc \
             -Dprefix=$SYSROOT/opt/perl5 \
             -Dusethreads \
             -Duseshrplib \
make -j$(nproc)
make -j$(nproc) test
make install

epilog

