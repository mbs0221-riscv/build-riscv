#!/bin/bash
# AUTOMATIC GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
export SOURCES=~/rpmbuild/SOURCES
export BUILD=~/rpmbuild/BUILD
export NAME=openssl
export VERSION=1.1.1k
export URL=https://www.openssl.org/source/openssl-1.1.1k.tar.gz
export SOURCE=openssl-1.1.1k.tar.gz
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
export STRIP=riscv64-unknown-linux-gnu-strip
export PLATFORM=riscv64gc
#./config no-asm --prefix=$ROOTFS/usr --shared
./config no-asm --prefix=$SYSROOT/usr        \
                --shared                          \
sed -i 's/-m64//g' Makefile
make -j$(nproc)
#install
cd $__build_dir_
make install
#clean

#files
#defattr(-,root,root,-)
test $? -eq 0 || exit 0
cd $__build_dir_
