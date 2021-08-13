#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=libnfsidmap
export VERSION=0.25
export URL=http://www.citi.umich.edu/projects/nfsv4/linux/libnfsidmap/libnfsidmap-0.25.tar.gz
export SOURCE=libnfsidmap-0.25.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#build
cd $__build_dir_
./configure --prefix=$SYSROOT/usr                     \
            --host=riscv64-unknown-linux-gnu               \
            --enable-shared &&
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
