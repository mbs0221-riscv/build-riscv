#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://ftp.pcre.org/pub/pcre/pcre-8.45.tar.bz2
./configure --prefix=$SYSROOT/usr/ 
            --host=riscv64-unknown-linux-gnu 
            --docdir=$SYSROOT/usr/share/doc/pcre-8.45 
            --enable-unicode-properties       
            --enable-pcre16                   
            --enable-pcre32                   
            --enable-pcregrep-libz            
            --disable-static                 &&
make
make -j8
make install
