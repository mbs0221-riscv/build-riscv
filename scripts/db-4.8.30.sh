#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY

source build-utils.sh

parse_url            https://src.fedoraproject.org/repo/pkgs/db4/db-4.8.30.tar.gz/f80022099c5742cd179343556179aa8c/db-4.8.30.tar.gz
cd build_unix/
../dist/configure --prefix=$SYSROOT/usr/local \
                  --host=riscv64-unknown-linux-gnu 
cd build_unix/
make -j8
cd build_unix/
make install

epilog

