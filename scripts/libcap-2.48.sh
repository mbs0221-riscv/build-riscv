#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=libcap
export VERSION=2.48
export URL=https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.48.tar.xz
export SOURCE=libcap-2.48.tar.xz
#description
#pre
#post
#prep
#wget https://www.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.48.tar.xz
export __build_dir_=$BUILD/$NAME-$VERSION
cd $SOURCES
#setup
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C $BUILD
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/local \
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
#config
#doc
test $? -eq 0 || exit 0
cd $__build_dir_
