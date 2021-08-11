#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://ftp.osuosl.org/pub/rpm/releases/rpm-4.16.x/rpm-4.16.1.3.tar.bz2
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/usr/local/lib/pkgconfig:$PKG_CONFIG_PATH
export PKG_CONFIG_PATH=$SYSROOT/opt/sqlite3/lib/pkgconfig:$PKG_CONFIG_PATH
export PYTHON_CFLAGS=-I$SYSROOT/usr/include/python3.9
export PYTHON_LIBS=-L$SYSROOT/usr/lib/python3.9
./configure --prefix=$SYSROOT/usr/ 
            --host=riscv64-unknown-linux-gnu 
            --enable-python 
            --enable-sqlite=yes 
            --enable-shared 
            --without-lua
make -j8
make install
