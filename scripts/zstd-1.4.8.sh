#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=zstd
export VERSION=1.4.8
export URL=https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz
export SOURCE=zstd-1.4.8.tar.gz
#description
#pre
#post
#prep
#wget https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
#build
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
make -j$(nproc)
#install
cd $__build_dir_
make DESTDIR=$SYSROOT/usr/local install
#clean

#files
#defattr(-,root,root,-)
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
