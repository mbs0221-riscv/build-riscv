#!/bin/bash
# AUTO GENERATED SCRIPTS FROM RPM SPEC FILE, DO NOT MODIFY
cd ~/rpmbuild/SOURCES
export NAME=zstd
export VERSION=1.4.8
export URL=https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz
export SOURCE=zstd-1.4.8.tar.gz
#wget https://github.com/facebook/zstd/releases/download/v1.4.8/zstd-1.4.8.tar.gz
test -e $SOURCE || wget $URL && tar -xvf $SOURCE -C ~/rpmbuild/BUILD && cd ~/rpmbuild/BUILD
export __build_dir_=$NAME-$VERSION
cd $__build_dir_
./configure --prefix=$SYSROOT/usr/local \
--host=riscv64-unknown-linux-gnu \
cd $__build_dir_
make -j$(nproc)
cd $__build_dir_
make install
test $? -eq 0 || exit 0
cd ~/rpmbuild/BUILD
cd $__build_dir_
rm -rf $__build_dir_
