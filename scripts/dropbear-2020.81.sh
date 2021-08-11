#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://matt.ucc.asn.au/dropbear/releases/dropbear-2020.81.tar.bz2
./configure --prefix=$SYSROOT/usr/local 
            --host=riscv64-unknown-linux-gnu 
            --with-zlib=$SYSROOT/usr
make PROGRAMS=dropbear dbclient dropbearkey dropbearconvert scp SCPPROGRESS=1 strip
make PROGRAMS=dropbear dbclient dropbearkey dropbearconvert scp SCPPROGRESS=1 install
#ln -s /usr/local/bin/dbclient /usr/bin/dbclient
