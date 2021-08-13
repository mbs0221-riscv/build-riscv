#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=zlib
export VERSION=1.2.11
export URL=http://www.zlib.net/zlib-1.2.11.tar.gz
export SOURCE=zlib-1.2.11.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
export CROSS_PREFIX=riscv64-unknown-linux-gnu-
export PLATFORM=riscv64gc
./configure --prefix=$SYSROOT/usr
cd $__build_dir_
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
