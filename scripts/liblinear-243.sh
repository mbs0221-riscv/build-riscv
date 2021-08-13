#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=liblinear
export VERSION=243
export URL=https://github.com/cjlin1/liblinear/archive/v243/liblinear-243.tar.gz
export SOURCE=liblinear-243.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#build
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
make lib
#install
cd $__build_dir_
mkdir -p $SYSROOT/usr/include
mkdir -p $SYSROOT/usr/lib
install -vm644 linear.h $SYSROOT/usr/include &&
install -vm755 liblinear.so.4 $SYSROOT/usr/lib &&
ln -sfv liblinear.so.4 $SYSROOT/usr/lib/liblinear.so
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
