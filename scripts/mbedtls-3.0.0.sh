#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=mbedtls
export VERSION=3.0.0
export URL=https://github.com/ARMmbed/mbedtls/archive/refs/tags/v3.0.0.tar.gz
export SOURCE=v3.0.0.tar.gz
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
mkdir build &&
cd build &&
cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr/local/ \
      -DUSE_SHARED_MBEDTLS_LIBRARY=On ../
make -j$(nproc)
#install
cd $__build_dir_
cd build
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
