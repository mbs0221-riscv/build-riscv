#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=glibc
export VERSION=2.33
export URL=http://ftp.gnu.org/gnu/glibc/glibc-2.33.tar.xz
export SOURCE=glibc-2.33.tar.xz
#wget http://ftp.gnu.org/gnu/glibc/glibc-2.33.tar.xz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
mkdir build && cd build
../configure --prefix=$SYSROOT/ \
--host=riscv64-unknown-linux-gnu \
cd $__build_dir_
cd build
make -j$(nproc)
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
