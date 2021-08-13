#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=liblinear
export VERSION=243
export URL=https://github.com/cjlin1/liblinear/archive/v243/liblinear-243.tar.gz
export SOURCE=liblinear-243.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
make lib
cd $__build_dir_
mkdir -p $SYSROOT/usr/include
mkdir -p $SYSROOT/usr/lib
install -vm644 linear.h $SYSROOT/usr/include &&
install -vm755 liblinear.so.4 $SYSROOT/usr/lib &&
ln -sfv liblinear.so.4 $SYSROOT/usr/lib/liblinear.so
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
