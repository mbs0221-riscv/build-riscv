#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            http://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.0.tar.gz
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu
make -j8
make install

epilog

