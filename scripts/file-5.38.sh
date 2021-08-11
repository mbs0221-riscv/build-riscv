#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            http://repository.timesys.com/buildsources/f/file/file-5.38/file-5.38.tar.gz
#./configure --prefix=$SYSROOT/usr/local/ 
#            --host=riscv64-unknown-linux-gnu
#make -j8 prefix=$SYSROOT/usr/local && make install prefix=$SYSROOT/usr/local
./configure --prefix=$SYSROOT/usr/local/ 
            --host=riscv64-unknown-linux-gnu
make -j8
make install
