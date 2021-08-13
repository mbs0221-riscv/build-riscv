#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=file
export VERSION=5.38
export URL=http://repository.timesys.com/buildsources/f/file/file-5.38/file-5.38.tar.gz
export SOURCE=file-5.38.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#./configure --prefix=$SYSROOT/usr/local/ \
#            --host=riscv64-unknown-linux-gnu
#make -j$(nproc) prefix=$SYSROOT/usr/local && make install prefix=$SYSROOT/usr/local
./configure --prefix=$SYSROOT/usr/local/ \
            --host=riscv64-unknown-linux-gnu
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
