#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=libtirpc
export VERSION=1.3.2
export URL=https://downloads.sourceforge.net/libtirpc/libtirpc-1.3.2.tar.bz2
export SOURCE=libtirpc-1.3.2.tar.bz2
#description
libtirpc.so
	provides the Remote Procedure Call (RPC) API functions required by other programs.
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --disable-gssapi \
            --enable-shared
#build
cd $__build_dir_
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
