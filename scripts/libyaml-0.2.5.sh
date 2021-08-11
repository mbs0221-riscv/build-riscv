#!/bin/bash
# AUTO GENERATED SCRIPTS BY convert.sh

source build-utils.sh

parse_url            https://github.com/yaml/libyaml/archive/0.2.5/libyaml-0.2.5.tar.gz
./bootstrap &&
./configure --prefix=$SYSROOT/usr/local 
            --host=riscv64-unknown-linux-gnu 
            --disable-static
make -j8
make install
