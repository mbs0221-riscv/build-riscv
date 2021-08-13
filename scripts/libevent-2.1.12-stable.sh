#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=libevent
export VERSION=2.1.12
export URL=https://github.com/libevent/libevent/releases/download/release-2.1.12-stable/libevent-2.1.12-stable.tar.gz
export SOURCE=libevent-2.1.12-stable.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup/
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
export __build_dir_=$BUILD/libevent-2.1.12-stable
cd $__build_dir_
#build
cd $__build_dir_
sed -i 's/python/&3/' event_rpcgen.py
./configure --prefix=$SYSROOT/usr                     \
            --host=riscv64-unknown-linux-gnu               \
            --enable-shared                                &&
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
