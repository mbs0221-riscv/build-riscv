#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=lzbench
export VERSION=1.8.1
export URL=https://github.com/inikep/lzbench/archive/refs/tags/v1.8.1.tar.gz
export SOURCE=v1.8.1.tar.gz
#description
#pre
#post
#prep
#wget https://github.com/inikep/lzbench/archive/refs/tags/v1.8.1.tar.gz
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup/
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
export __build_dir_=$BUILD/lzbench-1.8.1
cd $__build_dir_
#build
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
