#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=lzbench
export VERSION=1.8.1
export URL=https://github.com/inikep/lzbench/archive/refs/tags/v1.8.1.tar.gz
export SOURCE=v1.8.1.tar.gz
#wget https://github.com/inikep/lzbench/archive/refs/tags/v1.8.1.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=export __build_dir_=$NAME-$VERSION -n lzbench-1.8.1
cd $__build_dir_
cd $__build_dir_
export CC=riscv64-unknown-linux-gnu-gcc
export CXX=riscv64-unknown-linux-gnu-g++
make -j$(nproc)
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
