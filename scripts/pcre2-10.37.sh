#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            https://ftp.pcre.org/pub/pcre/pcre2-10.37.tar.bz2
./configure --prefix=$SYSROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
            --docdir=$SYSROOT/usr/share/doc/pcre2-10.37 \
            --enable-unicode                    \
            --enable-pcre2-16                   \
            --enable-pcre2-32                   \
            --enable-pcre2grep-libz             \
            --enable-pcre2test-libreadline      \
            --disable-static                    
make -j$(nproc)
make install

epilog

