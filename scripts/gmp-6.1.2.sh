#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=gmp
export VERSION=6.1.2
export URL=http://ftp.gnu.org/gnu/gmp/gmp-6.1.2.tar.xz
export SOURCE=gmp-6.1.2.tar.xz
# ./configure --prefix=$SYSROOT/usr --host=riscv64-unknown-linux-gnu
# make -j8 prefix=$SYSROOT/usr && make install prefix=$SYSROOT/usr
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr \
--host=riscv64-unknown-linux-gnu \
cd $__build_dir_
make -j8
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
