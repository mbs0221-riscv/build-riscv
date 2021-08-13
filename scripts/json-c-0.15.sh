#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=json-c
export VERSION=0.15
export URL=https://s3.amazonaws.com/json-c_releases/releases/json-c-0.15.tar.gz
export SOURCE=json-c-0.15.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
mkdir build &&
cd    build &&
cmake -DCMAKE_INSTALL_PREFIX=$SYSROOT/usr \
-DCMAKE_BUILD_TYPE=Release \
-DBUILD_STATIC_LIBS=OFF    \
.. &&
make
cd $__build_dir_
cd build
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
