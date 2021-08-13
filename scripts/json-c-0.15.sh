#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=json-c
export VERSION=0.15
export URL=https://s3.amazonaws.com/json-c_releases/releases/json-c-0.15.tar.gz
export SOURCE=json-c-0.15.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#build
cd $__build_dir_
mkdir build &&
cd    build &&
cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr \
      -DCMAKE_BUILD_TYPE=Release \
      -DBUILD_STATIC_LIBS=OFF    \
      .. &&
make
#install
cd $__build_dir_
cd build
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
