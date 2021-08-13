#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=rpcsvc-proto
export VERSION=1.4.2
export URL=url
export SOURCE=rpcsvc-proto-1.4.2.tar.xz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr          \
--host=riscv64-unknown-linux-gnu
cd $__build_dir_
make -j8
cd $__build_dir_
make install-strip
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
