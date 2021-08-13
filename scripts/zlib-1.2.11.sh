#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=zlib
export VERSION=1.2.11
export URL=http://www.zlib.net/zlib-1.2.11.tar.gz
export SOURCE=zlib-1.2.11.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
export CROSS_PREFIX=riscv64-unknown-linux-gnu-
export PLATFORM=riscv64gc
./configure --prefix=$SYSROOT/usr
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
