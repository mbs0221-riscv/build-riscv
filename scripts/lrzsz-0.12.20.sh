#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=lrzsz
export VERSION=0.12.20
export URL=https://src.fedoraproject.org/repo/pkgs/lrzsz/lrzsz-0.12.20.tar.gz/b5ce6a74abc9b9eb2af94dffdfd372a4/lrzsz-0.12.20.tar.gz
export SOURCE=lrzsz-0.12.20.tar.gz
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
export AR=riscv64-unknown-linux-gnu-ar
export RANLIB=riscv64-unknown-linux-gnu-ranlib
export STRIP=riscv64-unknown-linux-gnu-strip
./configure --host=riscv64-unknown-linux-gnu           \
            --prefix=$SYSROOT/usr/local
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,ubuntu,ubuntu,-)
test $? -eq 0 || exit 0
cd $__build_dir_
