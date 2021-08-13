#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=libwebsockets
export VERSION=4.2.1
export URL=https://github.com/warmcat/libwebsockets/archive/refs/tags/v4.2.1.tar.gz
export SOURCE=v4.2.1.tar.gz
#description
#pre
#post
#prep
#wget https://github.com/warmcat/libwebsockets/archive/refs/tags/v4.2.1.tar.gz
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
mkdir build && cd build
#build
cd $__build_dir_
export CROSS_COMPILE=riscv64-unknown-linux-gnu
export INSTALL_PREFIX=$SYSROOT/usr
cd build
cmake .. \
    -DLWS_IPV6=YES \
    -DOPENSSL_INCLUDE_DIR=$SYSROOT/usr/include \
    -DOPENSSL_LIBRARIES=$SYSROOT/usr/lib \
    -DOPENSSL_ROOT_DIR=$SYSROOT/usr/lib \
    -DCMAKE_C_COMPILER=$CROSS_COMPILE-gcc \
    -DCMAKE_CXX_COMPILER=$CROSS_COMPILE-g++ \
    -DCMAKE_AR=$RISCV/bin/$CROSS_COMPILE-ar \
    -DCMAKE_RANLIB=$RISCV/bin/$CROSS_COMPILE-ranlib \
    -DCMAKE_INSTALL_PREFIX=$INSTALL_PREFIX \
    -DLIB_SUFFIX=64
make
#install
cd $__build_dir_
cd build
make install
#clean

#files
#defattr(-,root,root,-)
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
