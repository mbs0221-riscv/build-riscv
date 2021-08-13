#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=htop
export VERSION=2.2.0
export URL=http://hisham.hm/htop/releases/2.2.0/htop-2.2.0.tar.gz
export SOURCE=htop-2.2.0.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#build
cd $__build_dir_
export CPPFLAGS=-I$SYSROOT/include
export LDFLAGS=-L$SYSROOT/lib
./configure --prefix=$SYSROOT/usr           \
            --disable-unicode                    \
            --host=riscv64-unknown-linux-gnu     &&
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
