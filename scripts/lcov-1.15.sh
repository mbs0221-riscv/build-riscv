#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=lcov
export VERSION=1.15
export URL=https://sourceforge.net/projects/ltp/files/Coverage%20Analysis/LCOV-1.15/lcov-1.15.tar.gz
export SOURCE=lcov-1.15.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
make clean && make
cd $__build_dir_
export DESTDIR=$SYSROOT
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
