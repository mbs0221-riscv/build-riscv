#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=openssl
export VERSION=1.1.1k
export URL=https://www.openssl.org/source/openssl-1.1.1k.tar.gz
export SOURCE=openssl-1.1.1k.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
export AR=riscv64-unknown-linux-gnu-ar
export STRIP=riscv64-unknown-linux-gnu-strip
export PLATFORM=riscv64gc
#./config no-asm --prefix=$ROOTFS/usr --shared
./config no-asm --prefix=$SYSROOT/usr        \
--shared                          \
sed -i 's/-m64//g' Makefile
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
