#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=libtool
export VERSION=2.4.6
export URL=http://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz
export SOURCE=libtool-2.4.6.tar.xz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/ \
            --host=riscv64-unknown-linux-gnu \
#build
cd $__build_dir_
make -j$(nproc)
#install
cd $__build_dir_
make install
# libtool --finish $SYSROOT/usr/lib
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
