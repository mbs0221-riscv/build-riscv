#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            http://www.us.tcpdump.org/release/libpcap-1.9.1.tar.gz
./configure --prefix=$SYSROOT/usr/local \
            --host=riscv64-unknown-linux-gnu \
            --target=riscv64-unknown-linux-gnu \
            --with-pcap=linux
make -j8
make install

epilog

