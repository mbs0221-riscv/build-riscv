#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=libseccomp
export VERSION=2.5.1
export URL=https://github.com/seccomp/libseccomp/releases/download/v2.5.1/libseccomp-2.5.1.tar.gz
export SOURCE=libseccomp-2.5.1.tar.gz
#description
#prep
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
#build
cd $__build_dir_
./configure --prefix=$SYSROOT/usr \
            --host=riscv64-unknown-linux-gnu \
            --with-sysroot=$SYSROOT \
            --enable-dependency-tracking \
            --enable-silent-rules \
            --enable-shared \
            --disable-static &&
make
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
