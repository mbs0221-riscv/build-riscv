#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=module-init-tools
export VERSION=3.15
export URL=https://mirrors.edge.kernel.org/pub/linux/utils/kernel/module-init-tools/module-init-tools-3.15.tar.gz
export SOURCE=module-init-tools-3.15.tar.gz
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
./configure --prefix=$SYSROOT \
            --host=riscv64-unknown-linux-gnu \
            --enable-zlib &&
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
