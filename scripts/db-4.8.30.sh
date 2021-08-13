#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=db
export VERSION=4.8.30
export URL=https://src.fedoraproject.org/repo/pkgs/db4/db-4.8.30.tar.gz/f80022099c5742cd179343556179aa8c/db-4.8.30.tar.gz
export SOURCE=db-4.8.30.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
cd build_unix/
../dist/configure --prefix=$SYSROOT/usr/local \
                  --host=riscv64-unknown-linux-gnu
#build
cd $__build_dir_
cd build_unix/
make -j$(nproc)
#install
cd $__build_dir_
cd build_unix/
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
