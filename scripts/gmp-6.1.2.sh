#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=gmp
export VERSION=6.1.2
export URL=http://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
export SOURCE=gmp-6.1.2.tar.xz
#description
# ./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu
# make -j$(nproc) prefix=$SYSROOT/usr && make install prefix=$SYSROOT/usr
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
#build
cd $__build_dir_
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
