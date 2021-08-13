#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=htop
export VERSION=2.2.0
export URL=http://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz
export SOURCE=htop-2.2.0.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
export CPPFLAGS=-I$SYSROOT/include
export LDFLAGS=-L$SYSROOT/lib
./configure --prefix=$SYSROOT/usr           \
--disable-unicode                    \
--host=riscv64-unknown-linux-gnu     &&
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
