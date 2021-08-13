#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=libtirpc
export VERSION=1.3.2
export URL=https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.2.tar.bz2
export SOURCE=libtirpc-1.3.2.tar.bz2
libtirpc.so
provides the Remote Procedure Call (RPC) API functions required by other programs.
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr \
--host=riscv64-unknown-linux-gnu \
--disable-gssapi \
--enable-shared
cd $__build_dir_
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
