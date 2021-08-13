#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=mbedtls
export VERSION=3.0.0
export URL=https://github.com/ARMmbed/mbedtls/archive/refs/tags/v3.0.0.tar.gz
export SOURCE=v3.0.0.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
mkdir build &&
cd build &&
cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr/local/ \
-DUSE_SHARED_MBEDTLS_LIBRARY=On ../
make -j8
cd $__build_dir_
cd build
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
