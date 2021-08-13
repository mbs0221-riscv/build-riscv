#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=libuuid
export VERSION=1.0.3
export URL=https://sourceforge.net/projects/libuuid/files/libuuid-1.0.3.tar.gz
export SOURCE=libuuid-1.0.3.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/local               \
--host=riscv64-unknown-linux-gnu               &&
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
